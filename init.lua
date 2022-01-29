local strParser = require("str").run;

-- p(strParser [[
--	 if asdf then
--		 print ("asdf",'asdf');
--	 end
-- ]]);

local extensions = {
	require("commentStart").run;
	require("commentEnd").run;
	require("let").run;
	require("neq").run;
	require("eq").run;
	require("not").run;
	require("or").run;
	require("and").run;
	require("null").run;
	require("is").run;
	require("end").run;
	require("while").run;
	require("then").run;
	require("libs.require").run;
	require("plus").run;
	require("minus").run;
	require("concat").run;
	require("do").run;
	require("print").run;
	require("else").run;
	require("if").run;
	require("true").run;
	require("false").run;
	require("function").run;
	require("comment").run;
};

local module = {};

function module.compile(str,env)
	env = env or {};

	-- parse string
	local strParsed = strParser(str);

	-- run extensions and make output
	local out = "";
	for _,this in ipairs(strParsed) do
		local m = this.m;
		local tstr = this.s;
		if not m then
			for _,func in ipairs(extensions) do
				tstr = func(tstr,env);
			end
			out = out .. tstr;
		elseif m == 1 then
			out = out .. ('"%s"'):format(tstr:gsub("\n","\\n"));
		elseif m == 2 then
			out = out .. ("'%s'"):format(tstr:gsub("\n","\\n"));
		elseif m == 3 then
			local estr = ("\"%s\""):format(tstr:gsub("\n","\\n"):gsub("'","\\'"):gsub('"','\\"'));
			local spec = estr:match("(\n +).-$");
			estr = estr:gsub("^([ 	%s]-\n[ 	%s]-)",""); -- bug? we need fix this
			if spec then
				out = out .. estr:gsub(spec,"\n");
			else
				out = out .. estr;
			end
		elseif m == 4 then
			out = out .. ("[[%s]]"):format(tstr);
		end
	end

	return out,env;
end

--		print (]] .. [[asdf]] .. [[)
-- print(module.compile [[
-- 	if asdfas then
-- 		print ("asdfasdf\"")
-- 		print ('asdfasdf')
-- 		print `
-- 			print("Hello!");
-- 		`;
-- 		let test = "Hello world";
-- 		if test || true then
-- 			return null;
-- 		end
-- 	end
-- ]])
local source = [[
-- 파일시스템 이다 요구하다 "fs"
-- 파일시스템.writeFileSync("안녕하세요","안녕!")

-- 지역 쿼리 이다 "사람"
-- 만약 쿼리 다르다 "사람" 이라면
-- 	출력("쿼리는 사람이 아니다")
-- 아니면
-- 	출력("쿼리는 사람이다")
-- 끝
-- 타이머 이다 요구하다 "timer"
-- 동안 참 하다
--   출력("안녕 세상")
--   타이머.sleep(200)
-- 끝

파일시스템 이다 요구하다 "fs"
제이슨 이다 요구하다 "json"
디스코드 이다 요구하다 "Discordia"
클라이언트 이다 디스코드.Client()
클라이언트.on("messageCreated",함수 (메시지)
  메시지:delete()
끝)
클라이언트.run("bot " 연결
	제이슨.decode(
		파일시스템.readFileSync"설정".토큰
	)
)
]]
source = [[
-- 주석시작
-- 여기에는 어떤걸 써도 작동하지 않습니다
-- 주석끝

-- 주석 여기에도 어떤걸 써도 작동하지 않습니다

-- 와 이다 "와"
-- 샌즈 이다 "샌즈"
-- 띄어쓰기 이다 " "
-- 출력(와 연결 띄어쓰기 연결 샌즈)

-- 파일시스템 이다 불러오기 "fs"
-- 만약 파일시스템.existsSync "안녕하세요" 이라면
-- 	출력(파일시스템.readFileSync "안녕하세요")
-- 끝

-- 출력(5 빼다 3 더하다 8 빼다 2 더하다 9 빼다 12 더하다 22)

주석 곱하다 나누다 나머지 크다 작다 크거나같다 작거나같다

파일시스템 이다 요구하다 "fs"
제이슨 이다 요구하다 "json"
디스코드 이다 요구하다 "Discordia"
클라이언트 이다 디스코드.Client()
클라이언트:on("messageCreate",함수 (메시지)
	지역 유저 이다 메시지.author
	출력(유저.name 연결 " 이 메시지를 보냈습니다")
	출력("내용 : " 연결 메시지.content)
끝)
클라이언트:run("Bot " 연결
	제이슨.decode(
		파일시스템.readFileSync"설정"
	).토큰
)

주석시작
지역 자다 이다 요구하다 "timer".sleep
동안 참 하다
	출력 "안녕 세상"
	자다(200)
끝
주석끝

]]
local output = module.compile(source)
print(source)
print("------------------------")
print(output)
print("------------------------")
_G.require = require
loadstring(output)()

return module;
