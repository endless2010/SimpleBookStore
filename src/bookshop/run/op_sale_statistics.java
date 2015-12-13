package bookshop.run;

import java.sql.ResultSet;
import java.util.ArrayList;

import bookshop.util.DataBase;
import bookshop.util.dataFormat;

public class op_sale_statistics {

	ArrayList al = new ArrayList();

	private String sqlStr;
	private ResultSet rs;

	public op_sale_statistics() {
	}

	public ArrayList getSaleNumOrder(String classid, String keyword) {
		String sql = "";
		if ((classid != null && !classid.equals(""))
				&& (keyword == null || keyword.equals(""))) {
			sql = "SELECT TOP 100 book.bookname bookname,sum(allorder.amount) num "
					+ " FROM allorder,book,bookclass "
					+ "  WHERE allorder.bookno=book.id  "
					+ "  AND book.bookclass=bookclass.id "
					+ "  AND bookclass.id='"
					+ classid
					+ "'"
					+ "  GROUP BY bookname  " + "  ORDER BY num DESC ";
		} else if ((classid == null || classid.equals(""))
				&& (keyword != null && !keyword.equals(""))) {
			sql = "SELECT TOP 100 book.bookname bookname,sum(allorder.amount) num "
					+ " FROM allorder,book,bookclass "
					+ "  WHERE allorder.bookno=book.id  "
					+ "  AND book.bookclass=bookclass.id "
					+ "  AND book.bookname LIKE '%"
					+ dataFormat.toUni(keyword)
					+ "%' " + "  GROUP BY bookname  " + "  ORDER BY num DESC ";
		} else if ((classid != null && !classid.equals(""))
				&& (keyword != null && !keyword.equals(""))) {
			sql = "SELECT TOP 100 book.bookname bookname,sum(allorder.amount) num "
					+ " FROM allorder,book,bookclass "
					+ "  WHERE allorder.bookno=book.id  "
					+ "  AND book.bookclass=bookclass.id "
					+ "  AND bookclass.id='"
					+ classid
					+ "'"
					+ "  AND book.bookname LIKE '%"
					+ dataFormat.toUni(keyword)
					+ "%' " + "  GROUP BY bookname  " + "  ORDER BY num DESC ";
		} else {
			sql = "SELECT TOP 100 book.bookname bookname,sum(allorder.amount) num FROM allorder,book "
					+ " WHERE allorder.bookno=book.id "
					+ " GROUP BY bookname "
					+ " ORDER BY num DESC";
		}

		DataBase db = new DataBase();
		try {
			// db.connect();
			// stmt = db.conn.createStatement ();
			System.out.println(sql);
			rs = db.stmt.executeQuery(sql);
			while (rs.next()) {
				String[] result = new String[2];
				result[0] = rs.getString("bookname");
				result[1] = rs.getString("num");
				al.add(result);
			}
			rs.close();
			db.finalize();
			return al;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			db.finalize();
			return null;
		}

	}

}