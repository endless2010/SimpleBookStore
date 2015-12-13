package bookshop.run;

import java.sql.ResultSet;
import java.util.Vector;

import bookshop.book.message;
import bookshop.util.DataBase;
import bookshop.util.dataFormat;

public class op_message {
	private javax.servlet.http.HttpServletRequest request;
	private ResultSet rs;
	private Vector messageList;
	private message theMessage;
	private int num = 0;

	public op_message() {
	}

	public int getNum() {
		return num;
	}

	public void setMessage(message aMessage) {
		theMessage = aMessage;
	}

	public Vector getMessageList() {
		return messageList;
	}

	public boolean getAllMessage() {
		try {
			messageList = new Vector();
			DataBase db = new DataBase();

			rs = db.stmt
					.executeQuery("select top 50 * from message order by time desc");

			while (rs.next()) {
				num++;
				message theMessage = new message();
				theMessage.setId(rs.getInt("id"));

				theMessage.setUserid(rs.getInt("userid"));

				theMessage.setUsername(rs.getString("username"));

				theMessage.setMessage(rs.getString("message"));
				theMessage.setTime(rs.getString("time"));
				messageList.addElement(theMessage);
			}
			rs.close();
			db.finalize();
			return true;
		} catch (Exception e) {
			System.out.println("exception occur");
			return false;
		}
	}

	public boolean insert() {
		try {
			int userid = theMessage.getUserid();
			// System.out.println(1);
			String username = theMessage.getUsername();

			String content = theMessage.getMessage();
			String timeStr = theMessage.getTime();
			// System.out.println(2);
			content = dataFormat.toSql(content);
			DataBase db = new DataBase();
			// System.out.println(3);
			String sqlString = "insert into message(userid,username,message,time)values('"
					+ userid
					+ "','"
					+ username
					+ "','"
					+ content
					+ "','"
					+ timeStr + "')";
			// System.out.println(sqlString);
			db.stmt.execute(sqlString);

			db.finalize();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean delete(int id) {
		String sqlStr = "delete from message where id='" + id + "'";
		DataBase db = new DataBase();
		try {
			db.stmt.execute(sqlStr);
			db.finalize();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}