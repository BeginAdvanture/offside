package com.offside.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.offside.dto.AttachImageVO;
import com.offside.dto.Criteria;
import com.offside.dto.GroundVO;
import com.offside.dto.MatchVO;
import com.offside.dto.OrderDTO;
import com.offside.dto.PageDTO;
import com.offside.service.AdminService;
import com.offside.service.StoreService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private StoreService storeService;

	@GetMapping("/main")
	public void adminMainGET() throws Exception {

	}

	@GetMapping("/groundEnroll")
	public void groundEnrollGET() throws Exception {

	}

	@PostMapping("/groundEnroll.do")
	public String groundEnrollPOST(GroundVO ground, RedirectAttributes rttr) throws Exception {
		adminService.groundEnroll(ground);
		rttr.addFlashAttribute("enroll_result", ground.getGroundName());
		return "redirect:/admin/groundManage";
	}

	@GetMapping("/groundManage")
	public void groundManageGET(Model model, Criteria cri) throws Exception {
		/* List로 보내줘야함 */
		List list = adminService.groundGetList(cri);
		if (!list.isEmpty()) {
			model.addAttribute("list", list); // 경기장 존재 경우
		} else {
			model.addAttribute("listCheck", "empty"); // 경기장 존재하지 않을 경우
		}
		int total = adminService.groundGetTotal(cri);

		PageDTO pageMaker = new PageDTO(cri, total);

		model.addAttribute("pageMaker", pageMaker);

	}

	@GetMapping("/matchEnroll")
	public void MatchEnrollGET(Model model) throws Exception {

		ObjectMapper objm = new ObjectMapper();
		List list = adminService.cateList();
		String cateList = objm.writeValueAsString(list);
		model.addAttribute("cateList", cateList);
	}

	@GetMapping("/matchManage")
	public void MatchManageGET(Model model, MatchVO match) throws Exception {

		List<MatchVO> matchList = adminService.matchList(match);
		model.addAttribute("matchList", matchList);

	}

	@PostMapping("/matchDelete")
	public String MatchDeletePOST(int matchId, RedirectAttributes rttr) {
		int result = 0;

		try {

			result = adminService.matchDelete(matchId);

		} catch (Exception e) {

			e.printStackTrace();
			result = 2;
			rttr.addFlashAttribute("delete_result", result);

			return "redirect:/admin/matchManage";

		}
		rttr.addFlashAttribute("delete_result", result);

		return "redirect:/admin/matchManage";

	}

	/* 작가 정보 삭제 */
	@PostMapping("/groundDelete")
	public String groundDeletePOST(int groundId, RedirectAttributes rttr) {

		int result = 0;

		try {

			result = adminService.groundDelete(groundId);

		} catch (Exception e) {

			e.printStackTrace();
			result = 2;
			rttr.addFlashAttribute("delete_result", result);

			return "redirect:/admin/groundManage";

		}
		rttr.addFlashAttribute("delete_result", result);

		return "redirect:/admin/groundManage";

	}

	/* 매치 등록 */
	@PostMapping("/matchEnroll")
	public String matchEnrollPOST(MatchVO match, RedirectAttributes rttr) {

		adminService.matchEnroll(match);

		rttr.addFlashAttribute("enroll_result", match.getMatchName());

		return "redirect:/admin/matchManage";
	}

	/* 경기장 검색 팝업창 */
	@GetMapping("/groundPop")
	public void groundPopGET(Criteria cri, Model model) throws Exception {

		/* 게시물 출력 데이터 */
		List list = adminService.groundGetList(cri);
		cri.setAmount(5);
		if (!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
		}

		/* 페이지 이동 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageDTO(cri, adminService.groundGetTotal(cri)));

	}

	/* 이미지 출력 */
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName) {

		File file = new File("c:\\upload\\" + fileName);

		ResponseEntity<byte[]> result = null;

		try {

			HttpHeaders header = new HttpHeaders();

			header.add("Content-type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;

	}

	/* 첨부 파일 업로드 */
	@PostMapping(value = "/uploadAjaxAction", produces = "application/json;charset=UTF-8")
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {

		/* 이미지 파일 체크 */
		for (MultipartFile multipartFile : uploadFile) {

			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;

			try {
				type = Files.probeContentType(checkfile.toPath());

			} catch (IOException e) {
				e.printStackTrace();
			}

			if (!type.startsWith("image")) {

				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);

			}

		} // for

		String uploadFolder = "C:\\upload";

		/* 날짜 폴더 경로 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		String datePath = str.replace("-", File.separator);

		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		/* 이미저 정보 담는 객체 */
		List<AttachImageVO> list = new ArrayList();

		// 향상된 for
		for (MultipartFile multipartFile : uploadFile) {

			/* 이미지 정보 객체 */
			AttachImageVO vo = new AttachImageVO();

			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);

			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);

			uploadFileName = uuid + "_" + uploadFileName;

			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);

			/* 파일 저장 */
			try {

				multipartFile.transferTo(saveFile);

				/* 썸네일 생성(ImageIO) */
				/*
				 * File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				 * 
				 * BufferedImage bo_image = ImageIO.read(saveFile);
				 * 
				 * //비율 double ratio = 3; //넓이 높이 int width = (int) (bo_image.getWidth() /
				 * ratio); int height = (int) (bo_image.getHeight() / ratio);
				 * 
				 * BufferedImage bt_image = new BufferedImage(width, height,
				 * BufferedImage.TYPE_3BYTE_BGR);
				 * 
				 * Graphics2D graphic = bt_image.createGraphics();
				 * 
				 * graphic.drawImage(bo_image, 0, 0,width,height, null);
				 * 
				 * ImageIO.write(bt_image, "jpg", thumbnailFile);
				 */

				/* 방법 2 */
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);

				BufferedImage bo_image = ImageIO.read(saveFile);

				// 비율
				double ratio = 4;
				// 넓이 높이
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);

				Thumbnails.of(saveFile).size(width, height).toFile(thumbnailFile);

			} catch (Exception e) {

				e.printStackTrace();

			}

			list.add(vo);

		} // for

		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);

		return result;
	}

	/* 이미지 파일 삭제 */
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {

		File file = null;

		try {
			/* 썸네일 파일 삭제 */
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));

			file.delete();

			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");

			file = new File(originFileName);

			file.delete();

		} catch (Exception e) {

			e.printStackTrace();

			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);

		} // catch

		return new ResponseEntity<String>("success", HttpStatus.OK);

	}

	/* 주문 현황 페이지 */
	@GetMapping("/orderList")
	public String orderListGET(Criteria cri, Model model) {
		List<OrderDTO> list = adminService.getOrderList(cri);

		if (!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", new PageDTO(cri, adminService.getOrderTotal(cri)));
		} else {
			model.addAttribute("listCheck", "empty");
		}

		return "/admin/orderList";
	}
}
