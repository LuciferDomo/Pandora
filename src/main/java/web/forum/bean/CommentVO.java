package web.forum.bean;

import java.io.Serializable;
import java.time.LocalDateTime;

public class CommentVO implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer commentNo;
	private Integer postId;
	private Integer memberId;
	private String commentContent;
	private LocalDateTime commentTime;
	private Integer status;
	private String reason;
	
	private String englishFirstName;

	public CommentVO() {
	}

	public CommentVO(Integer commentNo, Integer postId, Integer memberId, String commentContent,
			LocalDateTime commentTime, Integer status, String reason) {
		super();
		this.commentNo = commentNo;
		this.postId = postId;
		this.memberId = memberId;
		this.commentContent = commentContent;
		this.commentTime = commentTime;
		this.status = status;
		this.reason = reason;
	}

	public Integer getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(Integer commentNo) {
		this.commentNo = commentNo;
	}

	public Integer getPostId() {
		return postId;
	}

	public void setPostId(Integer postId) {
		this.postId = postId;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public LocalDateTime getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(LocalDateTime commentTime) {
		this.commentTime = commentTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getEnglishFirstName() {
		return englishFirstName;
	}

	public void setEnglishFirstName(String englishFirstName) {
		this.englishFirstName = englishFirstName;
	}
}
