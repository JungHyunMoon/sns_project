package com.moonstargram.post;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/moonstargram")
@Controller
public class PostController {

	@GetMapping("/post_create")
	public String postCreate(Model model) {
		model.addAttribute("viewName", "include/post_create");
		return "/layout";
	}
	
	
}
