package bookshop.run;

import bookshop.util.*;
import java.sql.*;

public class login {
	private String username; // ��¼�û���
	private String passwd; // ��¼����
	private boolean isadmin; // �Ƿ����Ա��¼
	private long userid = 0; // �û�ID��
	private String sqlStr;
	private ResultSet rs;

	public login() throws Exception {
		super();
		username = "";
		passwd = "";
		isadmin = false;
	}

	public void finalize() {
		// super.finalize();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String newusername) {
		username = newusername;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String newpasswd) {
		passwd = newpasswd;
	}

	public boolean getIsadmin() {
		return isadmin;
	}

	public void setIsadmin(boolean newIsadmin) {
		isadmin = newIsadmin;
	}

	public long getUserid() {
		return userid;
	}

	public void setUserid(long uid) {
		userid = uid;
	}

	/**
	 * ��ò�ѯ�û���Ϣ��sql���
	 * 
	 * @return
	 */
	public String getSql() {
		if (isadmin) {
			sqlStr = "SELECT adminpass FROM BookAdmin WHERE adminuser = '"
					+ dataFormat.toSql(username) + "'";
			// and adminpass = '" +
			// dataFormat.toSql(passwd) + "'";
		} else {
			sqlStr = "SELECT password, Id FROM shop_user WHERE username = '"
					+ dataFormat.toSql(username) + "'";
			// and password = '" + passwd + "'";
		}
		return sqlStr;
	}

	/**
    */
	public boolean excute() throws Exception {
		boolean flag = false;
		DataBase db = new DataBase();
		// db.connect();
		// stmt = db.conn.createStatement ();
		rs = db.stmt.executeQuery(getSql());
		if (rs.next()) {
			if (!isadmin) {
				userid = rs.getLong("Id");
			}
			// flag = true;
			passwd = passwd.trim();
			flag = passwd.equals(rs.getString(1).trim());
		}
		rs.close();
		db.finalize();
		return flag;
	}

	public boolean check(String username) {
		boolean flag = false;
		try {
			DataBase db = new DataBase();
			String sqlStr = "select * from shop_user where username='"
					+ username + "'";
			System.out.println(sqlStr);
			ResultSet rs = db.stmt.executeQuery(sqlStr);
			if (rs.next())
				flag = true;
			db.finalize();
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}
};
