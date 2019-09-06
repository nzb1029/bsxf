package org.bsxf.common.web.account;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/member/member")
public class MemberDetailController {/*
	@Autowired
	private MemberManager memberManager;

	@RequestMapping(value = { "save/{id}" })
	public String save(Member member, RedirectAttributes redirectAttributes, HttpServletRequest request) {

		memberManager.saveOrUpdateMember(member);
		redirectAttributes.addFlashAttribute("message", "修改菜单" + member.getName() + "成功");
		return "redirect:/member/member/list";
	}

	@ModelAttribute("member")
	public Member getMember(@PathVariable("id")
	String id) {
		return memberManager.getMember(id);
	}

*/
}
