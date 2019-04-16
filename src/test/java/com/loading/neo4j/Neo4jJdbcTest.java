package com.loading.neo4j;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import org.junit.Test;

public class Neo4jJdbcTest {

	@Test
	public void test01(){
		try {
		//jdbc:neo4j://localhost:7474/
		//jdbc:neo4j:bolt://localhost:7687/
			Connection conn = DriverManager.
					getConnection("jdbc:neo4j:bolt://localhost:7687/",
		/*Connection conn = DriverManager.
		getConnection("jdbc:neo4j://localhost:7474/",*/
				"neo4j", "123456");
		Statement statement = conn.createStatement();
		//ResultSet resultSet = statement.executeQuery("MATCH p=(x)-[r*]->() where not ()-[]->(x)  RETURN p as path");
		ResultSet resultSet = statement.executeQuery("match(n) return n limit 10");
		while (resultSet.next()) {
			Object o=resultSet.getObject("n");
			System.out.println(o);
		}
		resultSet.close();
		statement.close();
		conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
