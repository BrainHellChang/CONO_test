package com.itwillbs.cono.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.cono.vo.CategoryDTO;
import com.itwillbs.cono.vo.ImgDTO;
import com.itwillbs.cono.vo.ItemDTO;
import com.itwillbs.cono.vo.MemberDTO;
import com.itwillbs.cono.vo.ShopDTO;

public interface ShopMapper {

	// 상점 정보 조회
	ShopDTO selectMyShop(String member_id);

	// 상점 판매 횟수 조회
	String selectShopSellCnt(String member_id);

	// 상점 상품 개수 조회
	String selectShopItemCnt(String member_id);
	
	// 등록된 상품 개수(item_idx) 조회
	Integer selectItemIdx();
	
	// item 테이블 insert
	int insertItem(@Param("item") ItemDTO item, @Param("member_id") String member_id);
	
	// category 테이블 insert
	int insertCategory(@Param("category") CategoryDTO category, @Param("item") ItemDTO item);
	
	// img 테이블 img_idx 조회
	Integer selectImgIdx(ItemDTO item);
	
	// img 테이블 insert
	void insertImgList(@Param("img") ImgDTO img, @Param("item") ItemDTO item);
	
	// 상품 관리 (상품 리스트 조회)
	List<HashMap<String, String>> selectItemList(@Param("member_id") String member_id, @Param("keyword") String keyword, @Param("sell_status") String sell_status);
	
	// 상품 숨김 기능
	int updateItemHide(@Param("item_idx") String item_idx, @Param("item_hide") String item_hide);
	
	// 상품 상세 정보 조회
	HashMap<String, String> selectItemDetail(String item_idx);
	
	// 상품 이미지 조회
	List<ImgDTO> selectImgList(String item_idx);

	// 상품 이미지 변경
	int updateImg(@Param("item") ItemDTO item, @Param("img") ImgDTO img, @Param("img_idx") String img_idx);
	
	// 상품 삭제 (item)
	int deleteItem(@Param("member") MemberDTO member, @Param("item_idx") String item_idx);
	
	// 상품 삭제 (img)
	int deleteImg(String item_idx);
	
	// 상품 삭제 (category)
	int deleteCategory(String item_idx);
	
	// 상점 수정 회원 확인
	MemberDTO selectMember(MemberDTO member);
	
	// 상점 정보 수정
	void updateMyshop(@Param("shop") ShopDTO shop, @Param("member") MemberDTO member);

}
