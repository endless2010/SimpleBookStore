package bookshop.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DataBase {
	public Connection conn;
	public Statement stmt;
	public ResultSet rs = null;
	public InitialContext ctx = null;
	DataSource ds = null;
	public String sqlStr = "";
	public String m_strErrMsg = "";

	public DataBase() {
		this.connect();
	}

	public void finalize() {
		try {
			if (rs != null) {
				rs.close();
				;
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception ex) {
			System.out.println("connect db error:" + ex.getMessage());
		}
	}

	public boolean connect() {

		boolean bSuccess = true;
		boolean bUseJdbc = true;
		// 1) 使用MySQL数据库
		/*
		 * try{ Class.forName("org.gjt.mm.mysql.Driver").newInstance(); String
		 * url =
		 * "jdbc:mysql://localhost/BookStore?user=wxy&useUnicode=true&characterEncoding=8859_1"
		 * ; conn=DriverManager.getConnection(url); stmt = conn.createStatement
		 * (); bSuccess = true; }catch(Exception ee) { m_strErrMsg = "数据库错误：" +
		 * ee.getMessage();
		 * System.out.println("connect db error:"+ee.getMessage()); return
		 * false; }
		 */

		// 2) 使用数据库连接池
		try {
			ctx = new InitialContext();
			if (ctx == null) {
				throw new Exception("没有匹配的上下文环境");
			}

			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/SqlServermidp");
			if (ds == null) {
				throw new Exception("没有匹配的数据库");
			}
			conn = ds.getConnection();
			stmt = conn.createStatement();
			bSuccess = true;
		} catch (Exception ee) {
			m_strErrMsg = "使用连接池连接数据库时错误（请检查Server.xml配置）：" + ee.getMessage();
			System.out.println("connect db error:" + ee.getMessage());
			bSuccess = false;
		}

		// 3) 如果没有找到数据库连接池配置，则偿试采用下面的配置
		if (!bSuccess && bUseJdbc) {
			try {
				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				String url = "jdbc:odbc:bookstore";
				String login = "sa";
				String password = "sa";
				conn = DriverManager.getConnection(url, login, password);
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
						ResultSet.CONCUR_UPDATABLE);
				bSuccess = true;
				m_strErrMsg = "";
			} catch (Exception ee) {
				m_strErrMsg = "使用JDBC驱动连接数据库错误：" + ee.getMessage();
				System.out.println("connect db error:" + ee.getMessage());
				bSuccess = false;
			}
		}

		return bSuccess;
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();

		} catch (Exception ee) {
			System.out.println("connect db error:" + ee.getMessage());
			return;
		}

	}

	public static void main(String[] args) {
		try {
			DataBase db = new DataBase();
			db.connect();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
