package bookshop.book;

public class message {
	private int id;
	private int userid;
	private String username;
	private String theMessage;
	private String time;

	public message() {
		id = 0;
		userid = 0;
		username = "";
		theMessage = "";
		time = "";
	}

	public void setMessage(String newMessage) {
		theMessage = newMessage;
	}

	public String getMessage() {
		return theMessage;
	}

	public void setId(int newId) {
		id = newId;
	}

	public int getId() {
		return id;
	}

	public void setUsername(String name) {
		username = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUserid(int newid) {
		userid = newid;
	}

	public int getUserid() {
		return userid;
	}

	public void setTime(String newTime) {
		time = newTime;
	}

	public String getTime() {
		return time;
	}
}