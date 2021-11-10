package com.sbk.locallib.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import com.sbk.locallib.member.vo.MemberVO;
import com.sbk.locallib.member.dao.MemberMapper;
import com.sbk.locallib.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = { @Autowired })
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {

		log.warn("Load User By UserName : " + user_id);

		// userName means userid
		MemberVO vo = memberMapper.searchMember(user_id);

		log.warn("queried by member mapper: " + vo);

		return vo == null ? null : new CustomUser(vo);
	} 

}
