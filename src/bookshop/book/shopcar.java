package bookshop.book;

public class shopcar {

	private long bookId; // 图书ID编号
	private int quanlity; // 选购数量

	public shopcar() {
		bookId = 0;
		quanlity = 0;
	}

	public long getBookId() {
		return bookId;
	}

	public void setBookId(long newbookId) {
		bookId = newbookId;
	}

	public long getQuality() {
		return quanlity;
	}

	public void setQuanlity(int newquanlity) {
		quanlity = newquanlity;
	}
}
