package com.moonstargram.timeline;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moonstargram.comment.bo.CommentBO;
import com.moonstargram.comment.model.Comment;
import com.moonstargram.post.bo.PostBO;
import com.moonstargram.post.model.Post;

@Controller
public class TimelineController {

	@Autowired
	private PostBO postBO;
	@Autowired
	private CommentBO commentBO;

	@GetMapping("/moonstargram/timeline_view")
	public String timelineView(Model model) {
		List<Post> postList = postBO.getPostList();
		List<Comment> commentList = commentBO.getComment();
		
		model.addAttribute("postList", postList);
		model.addAttribute("commentList", commentList);
		model.addAttribute("viewName", "include/timeline");
		return "/layout";
	}
}
