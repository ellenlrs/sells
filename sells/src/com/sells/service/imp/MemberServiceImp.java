package com.sells.service.imp;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.sells.common.util.PageControl;
import com.sells.dao.Member;
import com.sells.dao.MemberDAO;
import com.sells.search.MemberSearch;

public class MemberServiceImp implements MemberService {
  private Log log = LogFactory.getLog(MemberServiceImp.class);
  private MemberDAO memberDAO;

  public Member findMember(String email, String sellsNo, String password)
      throws Exception {
    try {
      Collection col = memberDAO.login(email, sellsNo);
      Iterator itor = col.iterator();
      if (itor.hasNext()) {
        Member mem = (Member) itor.next();
        if (mem.getPassword().equals(password)) {
          if (mem.getStatus().equals("Y"))
            return mem;
          else
            throw new Exception("此帳號已停用,請聯絡賣場人員");
        } else {
          throw new Exception("帳號密碼錯誤-1");
        }
      } else {
        throw new Exception("帳號密碼錯誤-2");
      }
    } catch (Exception e) {
      throw new Exception("帳號密碼錯誤-3");
    }
  }

  public Member findMemberPassword(String email, String sellsNo, String name,
      String birthday) throws Exception {
    List col = memberDAO.login(email, sellsNo);
    Iterator itor = col.iterator();
    if (itor.hasNext()) {
      Member mem = (Member) itor.next();
      log.info("BB" + birthday);
      log.info("CC" + name);
      if (mem.getBirthDt().equals(birthday) && mem.getName().equals(name)) {
        if (mem.getStatus().equals("Y")) {
          return mem;
        } else {
          throw new Exception("此帳號已停用,請聯絡賣場人員");
        }
      } else {
        throw new Exception("查無此資料-姓名或出生年月日錯誤");
      }
    } else {
      throw new Exception("查無此資料-2");
    }
  }

  public Member getMember(String sellsNo, String memberNo) throws Exception {
    try {
      Member vo = memberDAO.getMember(memberNo, sellsNo);
      if (vo == null) {
        throw new Exception("查無此資料-1");
      } else {
        return vo;
      }
    } catch (Exception e) {
      throw new Exception("查無此資料-3");
    }
  }

  public void updateMemberUserSeq() {
    memberDAO.upgradeUserSeq();
  }

  public Member saveMember(Member vo) throws Exception {
    List col = memberDAO.login(vo.getEmail(), vo.getSellsNo());
    try {
      if (col.isEmpty()) {
        vo.setUserSeq(String.valueOf(findMemberBySearchSize(new MemberSearch(),
            vo.getSellsNo()) + 1));
        memberDAO.save(vo);
        return vo;
      } else {
        throw new Exception(vo.getEmail() + ": 此 Email 已加入過會員");
      }
    } catch (Exception e) {
      throw new Exception("加入會員異常," + e.getMessage());
    }
  }

  public boolean updateMember(Member vo) throws Exception {
    try {
      memberDAO.update(vo);
      return true;
    } catch (Exception e) {
      throw new Exception("修改會員異常," + e.getMessage());
    }
  }

  public Member findMemberById(String memId) throws Exception {
    try {
      return memberDAO.findById(memId);
    } catch (Exception e) {
      throw new Exception("查詢會員異常," + e.getMessage());
    }
  }

  public MemberDAO getMemberDAO() {
    return memberDAO;
  }

  public void setMemberDAO(MemberDAO memberDAO) {
    this.memberDAO = memberDAO;
  }

  public Collection findMemberBySearch(MemberSearch search, String sellsNo,
      PageControl control) throws Exception {
    return memberDAO.findMemberSearch(search, sellsNo, control);
  }

  public Collection findMemberBySearch2(MemberSearch search, String sellsNo)
      throws Exception {
    return memberDAO.findMemberSearch2(search, sellsNo);
  }

  public int findMemberBySearchSize(MemberSearch search, String sellsNo)
      throws Exception {
    return memberDAO.findMemberSearchSize(search, sellsNo);
  }
}