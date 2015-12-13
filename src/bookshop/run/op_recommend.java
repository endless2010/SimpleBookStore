package bookshop.run;

import java.sql.ResultSet;
import java.util.Vector;

import bookshop.book.recommend;
import bookshop.util.DataBase;

public class op_recommend {
	private Vector booklist;
	private ResultSet rs;

	public boolean insert(int bookid) {
		try {
			DataBase db = new DataBase();
			String sqlString = "insert into recommend(bookid)values('" + bookid
					+ "')";

			db.stmt.execute(sqlString);

			db.finalize();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public Vector getBooklist() {
		try {
			booklist = new Vector();
			DataBase db = new DataBase();
			String sqlString = "select top 6 * from recommend order by id desc";
			rs = db.stmt.executeQuery(sqlString);

			while (rs.next()) {
				recommend rec = new recommend();
				rec.setId(rs.getInt("id"));
				rec.setBookid(rs.getInt("bookid"));
				booklist.addElement(rec);
			}
			rs.close();
			db.finalize();
		} catch (Exception e) {
		}
		return booklist;
	}

	public boolean delete(int id) {
		try {
			DataBase db = new DataBase();
			String sqlString = "delete from recommend where bookid=" + id;

			db.stmt.execute(sqlString);
			db.finalize();
			return true;
		} catch (Exception e) {
			return false;
		}

	}
}