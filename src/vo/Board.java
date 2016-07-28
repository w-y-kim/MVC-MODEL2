package vo;

public class Board {
	   private int boardnum; //글번호
	   private String id;   //작성자 ID
	   private String title; //글제목
	   private String content; //글내용
	   private String inputdate; //작성 날짜, 시간
	   private int hits; //조회수

	   public Board(){}
	   
	   public Board(int boardnum, String id, String title, String content, String inputdate, int hits) {
	      super();
	      this.boardnum = boardnum;
	      this.id = id;
	      this.title = title;
	      this.content = content;
	      this.inputdate = inputdate;
	      this.hits = hits;
	   }
	   public int getBoardnum() {
	      return boardnum;
	   }
	   public void setBoardnum(int boardnum) {
	      this.boardnum = boardnum;
	   }
	   public String getId() {
	      return id;
	   }
	   public void setId(String id) {
	      this.id = id;
	   }
	   public String getTitle() {
	      return title;
	   }
	   public void setTitle(String title) {
	      this.title = title;
	   }
	   public String getContent() {
	      return content;
	   }
	   public void setContent(String content) {
	      this.content = content;
	   }
	   public String getInputdate() {
	      return inputdate;
	   }
	   public void setInputdate(String inputdate) {
	      this.inputdate = inputdate;
	   }
	   public int getHits() {
	      return hits;
	   }
	   public void setHits(int hits) {
	      this.hits = hits;
	   }

	@Override
	public String toString() {
		return "Board [boardnum=" + boardnum + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", inputdate=" + inputdate + ", hits=" + hits + "]";
	}


	}