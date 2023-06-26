import pandas as pd
import os
import psycopg2 as pg
import unittest
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
            select
                t2.command_nm as Football_Club,
                sum(t1.market_value) as Total_Players_Cost
            
            from football.players t1
                inner join football.football_clubs t2
                    on t1.command_nm = t2.command_nm
            
            group by football_club
            having min(t1.salary) >= 2000000
            order by total_players_cost desc;

        """
        result = pd.read_sql(query, con=self.conn)
        assert result.shape[1] == 2
        for i in range(1, result.shape[0]):
            assert result.iloc[i].loc['total_players_cost'] <= \
                   result.iloc[i - 1].loc['total_players_cost']

    def test2(self):
        query = """
            select
                tournament_id,
                prize_pool
            
            from football.tournaments
            where prize_pool > 0
            order by prize_pool desc;

        """
        result = pd.read_sql(query, con=self.conn)
        assert result.shape[1] == 2
        for i in range(result.shape[0]):
            if i > 0:
                assert result.iloc[i].loc['prize_pool'] <= \
                       result.iloc[i - 1].loc['prize_pool']

            assert result.iloc[i].loc['prize_pool'] > 0
            assert result.iloc[i].loc['tournament_id'] is not None

    def test3(self):
        query = """
            select
                t1.command_nm,
                t2.tournament_id,
                count(t2.command_nm) over (partition by t2.tournament_id) as teams_count
            from football.football_clubs t1
                inner join football.club_tournaments t2
                    on t1.command_nm = t2.command_nm
                inner join football.tournaments t3
                    on t2.tournament_id = t3.tournament_id;
            
        """
        result = pd.read_sql(query, con=self.conn)
        assert result.shape[1] == 3
        for i in range(1, result.shape[0]):
            assert result.iloc[i].loc['tournament_id'] is not None
            assert result.iloc[i].loc['tournament_id'] >= \
                   result.iloc[i - 1].loc['tournament_id']

    def test4(self):
        query = """
            select
                t1.name,
                t2.command_nm,
                dense_rank() over (order by t2.command_nm) as football_club_num
            
            from football.players t1
                inner join football.football_clubs t2
                    on t1.command_nm = t2.command_nm;
            
        """
        result = pd.read_sql(query, con=self.conn)
        assert result.shape[1] == 3
        for i in range(1, result.shape[0]):
            assert result.iloc[i].loc['command_nm'] >= \
                   result.iloc[i - 1].loc['command_nm']

    def test5(self):
        query = """
            select
                name,
                t2.command_nm,
                t1.salary,
                first_value(t1.salary)
                    over (
                        partition by t2.command_nm
                        order by t1.salary
                        ) as min_salary_in_the_club
            
            from football.players t1
                inner join football.football_clubs t2
                    on t1.command_nm = t2.command_nm;
      """
        result = pd.read_sql(query, con=self.conn)
        assert result.shape[1] == 4
        for i in range(result.shape[0]):
            assert result.iloc[i].loc['min_salary_in_the_club'] <= \
                   result.iloc[i].loc['salary']

    def test6(self):
        query = """
            select
                t3.tournament_id as tournament,
                t2.description_txt as achievement,
                t2.season_id as season
            
            from football.players t1
                inner join football.nominations t2
                    on t1.name = t2.player_nm
                left join football.awards t3
                    on t2.award_id = t3.award_id
            
            where 1=1
                and name like '%Messi'
                and season_id > 2018
            
            order by season;
        """
        result = pd.read_sql(query, con=self.conn)
        assert result.shape[1] == 3
        for i in range(1, result.shape[0]):
            assert result.iloc[i].loc['season'] <= result.iloc[i].loc['season']
            assert int(result.iloc[i].loc['season']) > 2018

    def end(self):
        self.cursor.close()
        self.conn.close()
