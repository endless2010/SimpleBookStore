package bookshop.book;

public class bookclass {
	private int Id; // ID���к�
	private String ClassName; // ͼ�����

	public bookclass() {
		Id = 0;
		ClassName = "";
	}

	public bookclass(int newId, String newname) {
		Id = newId;
		ClassName = newname;
	}

	public int getId() {
		return Id;
	}

	public void setId(int newId) {
		this.Id = newId;
	}

	public String getClassName() {
		return ClassName;
	}

	public void setClassName(String newname) {
		this.ClassName = newname;
	}
}
