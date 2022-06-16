package kr.co.gdu.stats;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AddrController {
   @GetMapping("/getAddr")
   public String getAddr(@RequestParam(value="currentPage", defaultValue = "1") int currentPage,
                  @RequestParam(value="keyword", defaultValue = "") String keyword) {
      // OPEN API 호출 URL 정보 설정
      final int countPerPage = 10;
      final String confmKey = "U01TX0FVVEgyMDIyMDYxNjE2MzExNTExMjY5ODQ=";
      final String resultType = "json";
      keyword = "가산디지털2로";
      
      StringBuffer sb = null;
      try {
      String apiUrl = "https://www.juso.go.kr/addrlink/addrLinkApi.do?currentPage="+currentPage+"&countPerPage="+countPerPage+"&keyword="+URLEncoder.encode(keyword,"UTF-8")+"&confmKey="+confmKey+"&resultType="+resultType;
         URL url = new URL(apiUrl);
          BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
          sb = new StringBuffer();
          String tempStr = null;
          while((tempStr = br.readLine()) != null){
             sb.append(tempStr);                        // 응답결과 JSON 저장
          }
      } catch(Exception e) {
         e.printStackTrace();
      }
       return sb.toString();
   }
   
}