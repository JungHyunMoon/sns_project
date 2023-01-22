package com.moonstargram.timeline;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.moonstargram.comment.bo.CommentBO;
import com.moonstargram.comment.model.Comment;
import com.moonstargram.post.bo.PostBO;
import com.moonstargram.post.model.Post;
import com.moonstargram.timeline.bo.TimelineBO;
import com.moonstargram.timeline.model.CardView;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/moonstargram")
@Controller
public class TimelineController {

	@Autowired
	private PostBO postBO;
	@Autowired
	private CommentBO commentBO;
	@Autowired
	private TimelineBO timelineBO;

	@GetMapping("/timeline_view")
	public String timelineView(
			Model model,
			HttpSession session) {
		
		if (session.getAttribute("userId") == null || session.getAttribute("userId") == "") {
			return "redirect:/moonstargram/sign_in_view";
		}
		
		List<Post> postList = postBO.getPostList();
		List<Comment> commentList = commentBO.getComment();
		
		model.addAttribute("postList", postList);
		model.addAttribute("commentList", commentList);
		
		List<CardView> cardList = timelineBO.generateCardList(session);
		model.addAttribute("cardList", cardList);
		
		
		
		model.addAttribute("viewName", "include/timeline");
		return "/layout";
	}
	
}
