# vworldgeocodeR

VWorld 도로명 주소 지오코딩을 위한 간단 패키지입니다.

```r
install.packages("remotes")  # remotes 패키지가 없으면 먼저 설치
remotes::install_github("derickspark/vworldgeocodeR")
```
** 중요!! **
Rcurl 이 설치되어 있어야 합니다 !! 

** 중요 !! ** 
VWorld API 키는 다음과 같이 발급받으실 수 있습니다. 
1. World 개발자센터 (https://www.vworld.kr)접속 후 회원가입
2. “오픈API 신청” → “인증키 발급”
3. 발급받은 인증키를 코드에 입력 

## 사용 예시 
 ```r
library(vworldgeocodeR)
api_key <- "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX" #여기에_본인_API_KEY_입력
```
---------------------------------------------
### 주소 하나를 지오코딩하는 경우
```r
result <- vworld_geocode(
  address = "서울특별시 중구 세종대로 110",
  api_key
)
print(result)
```
| address                      | lat       | lon       | status  |
|------------------------------|-----------|-----------|---------|
| 서울특별시 중구 세종대로 110 | 37.56635  | 126.9779  | success |

---------------------------------------------
### 여러개의 주소를 지오코딩하는 경우 
```r
addr_list <- c(
  "서울특별시 중구 세종대로 110",
  "부산광역시 해운대구 센텀서로 30",
  "광주광역시 동구 금남로 1"
)
results <- batch_geocode(
  addresses = addr_list,
  api_key 
)
print(results)
```

| address                      | lat       | lon       | status  |
|------------------------------|-----------|-----------|---------|
| 서울특별시 중구 세종대로 110 | 37.56635  | 126.9779  | success |
| 부산광역시 해운대구 센텀서로 30 | 35.17087  | 129.1303  | success |
| 광주광역시 동구 금남로 1     | 35.15038  | 126.9181  | success |

---------------------------------------------
참고 및 유의사항
	- 반드시 본인의 VWorld API Key를 입력해야 합니다.
  - Vworld의 지오코딩 지원정보는 https://www.vworld.kr/dev/v4dv_geocoderguide2_s001.do 를 참고하시기 바랍니다 
  - 대량 요청 시 VWorld API의 일일/분당 제한에 유의하세요.
	- 주소 오타, 비표준 표기 시 변환 실패 가능성이 있습니다.

---------------------------------------------

문의 및 이슈
	•	버그, 요청, 사용 문의 등은 derickspark@gmail.com 으로 연락 주세요.

