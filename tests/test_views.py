import pandas as pd
import os
import psycopg2 as pg
import unittest
import re
from dataclasses import dataclass

import user_data as ud

@dataclass
class Credentials:
    dbname: str = ud.DBName
    host: str = ud.HostName
    port: int = int(ud.PortName)
    user: str = ud.Username
    password: str = ud.Password


def psycopg2_conn_string():
    return f"""
        dbname='{os.getenv("DBNAME", Credentials.dbname)}' 
        user='{os.getenv("DBUSER", Credentials.user)}' 
        host='{os.getenv("DBHOST", Credentials.host)}' 
        port='{os.getenv("DBPORT", Credentials.port)}' 
        password='{os.getenv("DBPASSWORD", Credentials.password)}'
 """


def set_connection():
    return pg.connect(psycopg2_conn_string())


class TestHardQueries(unittest.TestCase):
    def __init__(self, *args, **kwargs):
        super(TestHardQueries, self).__init__(*args, **kwargs)
        self.conn = set_connection()
        self.cursor = self.conn.cursor()

    def test1(self):
        query = """
            select * from football.players_view;
        """
        result = pd.read_sql(query, con=self.conn)
        assert result.shape[1] == 5
        for i in range(result.shape[0]):
            assert '.' in result.iloc[i].loc['player_name']
            assert result.iloc[i].loc['player_name'] is not None
        for i in range(1, result.shape[0]):
            assert result.iloc[i].loc['player_name'] >= \
                   result.iloc[i - 1].loc['player_name']

    def test2(self):
        query = """
            select * from football.transfermarkt_view;
        """
        result = pd.read_sql(query, con=self.conn)
        assert result.shape[1] == 5
        for i in range(result.shape[0]):
            assert 'm' in result.iloc[i].loc['player_cost']
            assert 'k' in result.iloc[i].loc['player_salary']
            assert result.iloc[i].loc['name'] is not None

        for i in range(1, result.shape[0]):
            assert int(re.split('\.', result.iloc[i].loc['player_cost'])[0]) <= \
                   int(re.split('\.', result.iloc[i - 1].loc['player_cost'])[0])

    def test3(self):
        query = """
            select * from football.total_won_clubs;
        """
        result = pd.read_sql(query, con=self.conn)
        assert result.shape[1] == 3
        for i in range(1, result.shape[0]):
            assert result.iloc[i].loc['total_money_won'] <= \
                   result.iloc[i - 1].loc['total_money_won']

    def test4(self):
        query = """
            select * from football.avg_salary_cost;
        """
        result = pd.read_sql(query, con=self.conn)
        assert result.shape[1] == 3
        for i in range(1, result.shape[0]):
            assert result.iloc[i].loc['avg_market_value'] <= \
                   result.iloc[i - 1].loc['avg_market_value']

    def test5(self):
        query = """
            select * from football.players_awards_view;
        """
        result = pd.read_sql(query, con=self.conn)
        assert result.shape[1] == 3
        for i in range(1, result.shape[0]):
            assert result.iloc[i].loc['number_of_tropheys'] <= \
                   result.iloc[i - 1].loc['number_of_tropheys']
            if result.iloc[i].loc['number_of_tropheys'] == \
                   result.iloc[i - 1].loc['number_of_tropheys']:
                assert result.iloc[i].loc['number_of_individual_awards'] <= \
                    result.iloc[i - 1].loc['number_of_individual_awards']

    def end(self):
        self.cursor.close()
        self.conn.close()
