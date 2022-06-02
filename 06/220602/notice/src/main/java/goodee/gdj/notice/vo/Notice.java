package goodee.gdj.notice.vo;

import lombok.Data;

@Data
public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String createDate;
	private String noticePw;
}
