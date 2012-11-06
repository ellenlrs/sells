package com.sells.service.imp;

import java.util.Collection;

import com.sells.common.util.PageControl;
import com.sells.dao.Member;
import com.sells.search.MemberSearch;

public interface MemberService {
  /**
   * 加入會員
   * 
   * @param vo
   * @return
   * @throws Exception
   */
  public Member saveMember(Member vo) throws Exception;

  /**
   * 修改會員
   * 
   * @param vo
   * @return
   * @throws Exception
   */
  public boolean updateMember(Member vo) throws Exception;

  public void updateMemberUserSeq();

  /**
   * 讀取會員資料從ID資料
   * 
   * @param vo
   * @return
   * @throws Exception
   */
  public Member findMemberById(String memId) throws Exception;

  /**
   * 會員登入
   * 
   * @param vo
   * @return
   * @throws Exception
   */
  public Member findMember(String email, String sellsNo, String password)
      throws Exception;

  /**
   * 會員查詢密碼
   * 
   * @param vo
   * @return
   * @throws Exception
   */
  public Member findMemberPassword(String email, String sellsNo, String name,
      String birthday) throws Exception;

  /**
   * 取得會員
   * 
   * @param vo
   * @return
   * @throws Exception
   */
  public Member getMember(String sellsNo, String memberNo) throws Exception;

  /**
   * 搜尋會員
   * 
   * @param search
   * @param control
   * @return
   * @throws Exception
   */
  public Collection findMemberBySearch(MemberSearch search, String sellsNo,
      PageControl control) throws Exception;

  /**
   * 搜尋會員筆數
   * 
   * @param search
   * @return
   * @throws Exception
   */
  public int findMemberBySearchSize(MemberSearch search, String sellsNo)
      throws Exception;

  /**
   * 搜尋會員資料
   * 
   * @param search
   * @param sellsNo
   * @return
   * @throws Exception
   */
  public Collection findMemberBySearch2(MemberSearch search, String sellsNo)
      throws Exception;
}
