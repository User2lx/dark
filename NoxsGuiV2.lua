do local v0=(738 -(223 + 513))^(22 + 10) ;local v1=v0-(1 -0) ;local function v2(v71,v72) local v73=1248 -(111 + 1137) ;local v74;local v75;while true do if (v73==(158 -(91 + 67))) then local v257=0 -0 ;while true do if (v257==(0 + 0)) then v74,v75=0 + 0 ,1;while (v71~=(1636 -(1373 + 263))) or (v72~=(1000 -(451 + 549)))  do local v307,v308=v71%2 ,v72%(5 -3) ;local v309=(v307 + v308)%(1 + 1) ;v74=v74 + (v309 * v75) ;v71=math.floor(v71/2 );v72=math.floor(v72/(2 + 0) );v75=v75 * 2 ;end v257=1 -0 ;end if (v257==(1 -0)) then v73=1385 -(746 + 638) ;break;end end end if (v73==(1 + 0)) then return v74%v0 ;end end end local function v3(v76,v77,v78,...) local v79=0 -0 ;local v80;while true do if (v79==0) then v80=nil;if v77 then v76=v76%v0 ;v77=v77%v0 ;v80=v2(v76,v77);if v78 then v80=v3(v80,v78,...);end return v80;elseif v76 then return v76%v0 ;else return 0;end break;end end end local function v4(v81,v82,v83,...) local v84=341 -(218 + 123) ;local v85;while true do if (v84==(1581 -(1535 + 46))) then v85=nil;if v82 then local v280=0;while true do if (v280==(0 + 0)) then v81=v81%v0 ;v82=v82%v0 ;v280=33 -(19 + 13) ;end if (v280==(1 + 0)) then v85=((v81 + v82) -v2(v81,v82))/(2 -0) ;if v83 then v85=v4(v85,v83,...);end v280=562 -(306 + 254) ;end if (v280==(1 + 1)) then return v85;end end elseif v81 then return v81%v0 ;else return v1;end break;end end end local function v5(v86) return v1-v86 ;end local function v6(v87,v88) if (v88<(0 -0)) then return lshift(v87, -v88);end return math.floor((v87%((3 -1)^(9 + 23)))/((3 -1)^v88) );end local function v7(v89,v90) local v91=0 -0 ;while true do if (v91==(1467 -(899 + 568))) then if ((v90>(21 + 10)) or (v90< -(74 -43))) then return 603 -(268 + 335) ;end return v6(v89%v0 ,v90);end end end local function v8(v92,v93) local v94=290 -(60 + 230) ;while true do if (v94==(572 -(426 + 146))) then if (v93<(0 + 0)) then return v7(v92, -v93);end return (v92 * ((1458 -(282 + 1174))^v93))%((813 -(569 + 242))^(92 -60)) ;end end end local function v9(v95,v96) local v97=0 + 0 ;local v98;while true do if (v97==(0 + 0)) then v95=v95%v0 ;v96=v96%(1056 -(706 + 318)) ;v97=1252 -(721 + 530) ;end if ((1859 -(673 + 1185))==v97) then v98=v4(v95,((1273 -(945 + 326))^v96) -(3 -2) );return v7(v95,v96) + v8(v98,(79 -47) -v96 ) ;end end end local v10={1116353108 -(271 + 429) ,1899448941 -(1408 + 92) ,3049323471,3921010861 -(993 + 295) ,961988334 -(418 + 753) ,155516213 + 1353454780 ,2747900517 -294264769 ,2870763221 -0 ,3573372715 --51008365 ,110811316 + 199787085 ,1460662087 -853436809 ,1426881987,1965726804 -40648416 ,2065936838 --96141368 ,3771416159 -1156528056 ,3248222694 -(4 + 110) ,3835390985 -(57 + 527) ,4022226201 -(41 + 1386) ,179413323 + 84933755 ,1853980073 -1249172445 ,770256900 -(556 + 361) ,1249150122,2670572878 -1115491186 ,288675197 + 1707389789 ,2554220882 -0 ,2821834977 -(395 + 233) ,2795100740 --157896068 ,3076336382 --133977289 ,3336572471 -(361 + 219) ,3584528711 -0 ,2914680 + 111012313 ,338242877 -(18 + 964) ,475396194 + 190911011 ,487351823 + 286178089 ,1294757372,1396182417 -(116 + 10) ,1695184438 -(542 + 196) ,1986661540 -(457 + 32) ,2402937236 -225910886 ,3502926248 -1045970211 ,2730485921 -0 ,2820302411 -0 ,3259731921 -(118 + 1003) ,3345764771 -0 ,3516065817 -0 ,3600354693 -(1569 + 320) ,4094572886 -(553 + 424) ,520813818 -245390474 ,378994797 + 51232937 ,295173589 + 211775027 ,1172110520 -513049964 ,883997877,958139825 -(79 + 175) ,2935813135 -1612990917 ,1537003915 -(973 + 879) ,508267805 + 1239605974 ,4013029595 -2057467373 ,710886402 + 1313218413 ,2227731169 -(476 + 241) ,2361853626 -(373 + 829) ,3256851133 -828414659 ,3100654041 -343919854 ,3204031717 -(64 + 174) ,3180221322 --149103976 };local function v11(v99) return string.gsub(v99,".",function(v234) return string.format("%02x",string.byte(v234));end);end local function v12(v100,v101) local v102=101 -(19 + 82) ;local v103;while true do if (v102==(0 + 0)) then v103="";for v263=369 -(173 + 195) ,v101 do local v264=1201 -(209 + 992) ;local v265;while true do if (v264==(1 + 0)) then v100=(v100-v265)/(1760 -(363 + 1141)) ;break;end if (v264==(1580 -(1183 + 397))) then v265=v100%(779 -523) ;v103=string.char(v265)   .. v103 ;v264=1 + 0 ;end end end v102=1 + 0 ;end if (v102==(1 + 0)) then return v103;end end end local function v13(v104,v105) local v106=789 -(766 + 23) ;local v107;while true do if (v106==(0 + 0)) then local v258=1975 -(1913 + 62) ;while true do if (v258==(1 + 0)) then v106=2 -1 ;break;end if ((0 -0)==v258) then v107=0 -0 ;for v310=v105,v105 + (1936 -(565 + 1368))  do v107=(v107 * (962 -706)) + string.byte(v104,v310) ;end v258=1662 -(1477 + 184) ;end end end if ((1 -0)==v106) then return v107;end end end local function v14(v108,v109) local v110=0;local v111;while true do if (2==v110) then return v108;end if ((1 + 0)==v110) then v108=v108   .. "\128"   .. string.rep("\0",v111)   .. v109 ;assert(( #v108%(1544 -(641 + 839)))==(856 -(564 + 292)) );v110=2;end if (v110==(0 -0)) then v111=(192 -128) -((v109 + (313 -(244 + 60)))%(50 + 14)) ;v109=v12((484 -(41 + 435)) * v109 ,1009 -(938 + 63) );v110=1 + 0 ;end end end local function v15(v112) local v113=1125 -(936 + 189) ;while true do local v235=0;while true do if (v235==2) then if (v113==(857 -(174 + 680))) then v112[23 -16 ]=174006834 + 354727801 ;v112[8]=1100554343 + 440904882 ;v113=1617 -(1565 + 48) ;end break;end if (v235==0) then if (v113==(2 + 0)) then v112[1482 -(29 + 1448) ]=1359894257 -(782 + 356) ;v112[6]=2600822924 -0 ;v113=3;end if (v113==(267 -(176 + 91))) then v112[2 -1 ]=1665423208 --113610495 ;v112[1094 -(975 + 117) ]=3144134277;v113=1;end v235=1876 -(157 + 1718) ;end if (v235==(1 + 0)) then if (v113==(3 -2)) then v112[3]=2352193505 -1338289263 ;v112[4]=2773481780 -(697 + 321) ;v113=5 -3 ;end if (v113==4) then return v112;end v235=2;end end end end local function v16(v114,v115,v116) local v117={};for v236=1 -0 ,36 -20  do v117[v236]=v13(v114,v115 + ((v236-(1 + 0)) * (6 -2)) );end for v238=45 -28 ,1291 -(322 + 905)  do local v239=v117[v238-(626 -(602 + 9)) ];local v240=v3(v9(v239,1196 -(449 + 740) ),v9(v239,890 -(826 + 46) ),v7(v239,950 -(245 + 702) ));v239=v117[v238-(6 -4) ];v117[v238]=(v117[v238-(6 + 10) ] + v240 + v117[v238-(1905 -(260 + 1638)) ] + v3(v9(v239,7 + 10 ),v9(v239,46 -27 ),v7(v239,450 -(382 + 58) )))%v0 ;end local v118,v119,v120,v121,v122,v123,v124,v125=v116[3 -2 ],v116[2 + 0 ],v116[5 -2 ],v116[2 + 2 ],v116[14 -9 ],v116[1211 -(902 + 303) ],v116[7],v116[8];for v243=1 -0 ,154 -90  do local v244=v3(v9(v118,2),v9(v118,2 + 11 ),v9(v118,1712 -(1121 + 569) ));local v245=v3(v4(v118,v119),v4(v118,v120),v4(v119,v120));local v246=(v244 + v245)%v0 ;local v247=v3(v9(v122,6),v9(v122,28 -17 ),v9(v122,239 -(22 + 192) ));local v248=v3(v4(v122,v123),v4(v5(v122),v124));local v249=(v125 + v247 + v248 + v10[v243] + v117[v243])%v0 ;v125=v124;v124=v123;v123=v122;v122=(v121 + v249)%v0 ;v121=v120;v120=v119;v119=v118;v118=(v249 + v246)%v0 ;end v116[684 -(483 + 200) ]=(v116[1464 -(1404 + 59) ] + v118)%v0 ;v116[5 -3 ]=(v116[2 + 0 ] + v119)%v0 ;v116[3 -0 ]=(v116[3] + v120)%v0 ;v116[769 -(468 + 297) ]=(v116[2 + 2 ] + v121)%v0 ;v116[567 -(334 + 228) ]=(v116[16 -11 ] + v122)%v0 ;v116[6]=(v116[13 -7 ] + v123)%v0 ;v116[12 -5 ]=(v116[2 + 5 ] + v124)%v0 ;v116[8]=(v116[244 -(141 + 95) ] + v125)%v0 ;end local function v17(v134) local v135=0 + 0 ;local v136;while true do if (v135==(694 -(627 + 66))) then for v266=2 -1 , #v134,164 -100  do v16(v134,v266,v136);end return v11(v12(v136[2 -1 ],1 + 3 )   .. v12(v136[5 -3 ],2 + 2 )   .. v12(v136[3 + 0 ],4)   .. v12(v136[3 + 1 ],5 -1 )   .. v12(v136[3 + 2 ],4)   .. v12(v136[169 -(92 + 71) ],2 + 2 )   .. v12(v136[6 + 1 ],6 -2 )   .. v12(v136[773 -(574 + 191) ],4 + 0 ) );end if (v135==(0 -0)) then v134=v14(v134, #v134);v136=v15({});v135=1 + 0 ;end end end local v18;local v19={["\\"]="\\",['\"']='\"',["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"};local v20={["/"]="/"};for v137,v138 in pairs(v19) do v20[v138]=v137;end local v21=function(v140) return "\\"   .. (v19[v140] or string.format("u%04x",v140:byte())) ;end;local v22=function(v141) return "null";end;local v10=function(v142,v143) local v144=849 -(254 + 595) ;local v145;while true do if (v144==(127 -(55 + 71))) then if v143[v142] then error("circular reference");end v143[v142]=true;v144=1668 -(636 + 1030) ;end if ((0 -0)==v144) then v145={};v143=v143 or {} ;v144=1 + 0 ;end if ((1792 -(573 + 1217))==v144) then if ((rawget(v142,1 + 0 )~=nil) or (next(v142)==nil)) then local v281=0 -0 ;for v297 in pairs(v142) do local v298=0 + 0 ;while true do if (v298==(0 -0)) then if (type(v297)~="number") then error("invalid table: mixed or invalid key types");end v281=v281 + (940 -(714 + 225)) ;break;end end end if (v281~= #v142) then error("invalid table: sparse array");end for v299,v300 in ipairs(v142) do table.insert(v145,v18(v300,v143));end v143[v142]=nil;return "["   .. table.concat(v145,",")   .. "]" ;else local v283=0 -0 ;while true do if (v283==0) then for v320,v321 in pairs(v142) do local v322=0 -0 ;local v323;while true do if (v322==0) then v323=0;while true do if ((297 -(36 + 261))==v323) then if (type(v320)~="string") then error("invalid table: mixed or invalid key types");end table.insert(v145,v18(v320,v143)   .. ":"   .. v18(v321,v143) );break;end end break;end end end v143[v142]=nil;v283=1;end if (v283==(1 + 0)) then return "{"   .. table.concat(v145,",")   .. "}" ;end end end break;end end end;local v23=function(v146) return '"'   .. v146:gsub('[%z\1-\31\\"]',v21)   .. '"' ;end;local v24=function(v147) local v148=0 -0 ;while true do if (v148==(0 + 0)) then if ((v147~=v147) or (v147<= -math.huge) or (v147>=math.huge)) then error("unexpected number value '"   .. tostring(v147)   .. "'" );end return string.format("%.14g",v147);end end end;local v25={["nil"]=v22,table=v10,string=v23,number=v24,boolean=tostring};function v18(v149,v150) local v151=type(v149);local v152=v25[v151];if v152 then return v152(v149,v150);end error("unexpected type '"   .. v151   .. "'" );end local v26=function(v153) return v18(v153);end;local v27;local v28=function(...) local v154=0 + 0 ;local v155;while true do if (v154==(806 -(118 + 688))) then v155={};for v267=1,select("#",...) do v155[select(v267,...)]=true;end v154=49 -(25 + 23) ;end if (v154==(1 + 0)) then return v155;end end end;local v29=v28(" ","\t","\r","\n");local v30=v28(" ","\t","\r","\n","]","}",",");local v31=v28("\\","/",'"',"b","f","n","r","t","u");local v32=v28("true","false","null");local v33={["true"]=true,["false"]=false,null=nil};local v34=function(v156,v157,v158,v159) local v160=1886 -(927 + 959) ;local v161;while true do if (0==v160) then v161=0 -0 ;while true do if (v161==(732 -(16 + 716))) then for v311=v157, #v156 do if (v158[v156:sub(v311,v311)]~=v159) then return v311;end end return  #v156 + (1 -0) ;end end break;end end end;local v35=function(v162,v163,v164) local v165=97 -(11 + 86) ;local v166;local v167;while true do if (v165==(2 -1)) then for v269=286 -(175 + 110) ,v163-(2 -1)  do local v270=0 -0 ;while true do if (v270==(1379 -(1055 + 324))) then v167=v167 + (1797 -(503 + 1293)) ;if (v162:sub(v269,v269)=="\n") then local v324=0 -0 ;while true do if (v324==(0 + 0)) then v166=v166 + (1062 -(810 + 251)) ;v167=1 + 0 ;break;end end end break;end end end error(string.format("%s at line %d col %d",v164,v166,v167));break;end if (v165==(0 + 0)) then v166=1 + 0 ;v167=3 -2 ;v165=2 -1 ;end end end;local v36=function(v168) local v169=math.floor;if (v168<=(319 -192)) then return string.char(v168);elseif (v168<=(2580 -(43 + 490))) then return string.char(v169(v168/(797 -(711 + 22)) ) + (742 -550) ,(v168%(923 -(240 + 619))) + 97 + 31 );elseif (v168<=(167600 -102065)) then return string.char(v169(v168/4096 ) + 55 + 169 ,v169((v168%4096)/64 ) + (203 -75) ,(v168%(5 + 59)) + (1872 -(1344 + 400)) );elseif (v168<=(369252 + 744859)) then return string.char(v169(v168/(262549 -(255 + 150)) ) + 190 + 50 ,v169((v168%(140346 + 121798))/(17500 -13404) ) + (388 -260) ,v169((v168%(13229 -9133))/(1803 -(404 + 1335)) ) + 116 + 12 ,(v168%(470 -(183 + 223))) + (155 -27) );end error(string.format("invalid unicode codepoint '%x'",v168));end;local v37=function(v170) local v171=0 + 0 ;local v172;local v173;local v174;while true do if (v171==(0 + 0)) then v172=229 -(73 + 156) ;v173=nil;v171=1 + 0 ;end if (v171==(812 -(721 + 90))) then v174=nil;while true do if (v172==(338 -(10 + 327))) then if v174 then return v36(((((v173-55296) * (714 + 310)) + v174) -(56658 -(118 + 220))) + 21841 + 43695 );else return v36(v173);end break;end if (v172==(449 -(108 + 341))) then local v301=0 + 0 ;while true do if (v301==(0 -0)) then v173=tonumber(v170:sub(1 + 0 ,1 + 3 ),1509 -(711 + 782) );v174=tonumber(v170:sub(12 -5 ,33 -23 ),529 -(203 + 310) );v301=1994 -(1238 + 755) ;end if ((470 -(270 + 199))==v301) then v172=1 + 0 ;break;end end end end break;end end end;local v38=function(v175,v176) local v177=1819 -(580 + 1239) ;local v178;local v179;local v180;while true do if (v177==2) then v35(v175,v176,"expected closing quote for string");break;end if (v177==(0 -0)) then v178="";v179=v176 + (1 -0) ;v177=1 + 0 ;end if (v177==(3 -2)) then v180=v179;while v179<= #v175  do local v271=v175:byte(v179);if (v271<(2 + 30)) then v35(v175,v179,"control character in string");elseif (v271==(41 + 51)) then local v318=0 -0 ;local v319;while true do if (v318==(0 + 0)) then v178=v178   .. v175:sub(v180,v179-(1168 -(645 + 522)) ) ;v179=v179 + 1 + 0 ;v318=1791 -(1010 + 780) ;end if (v318==(1 + 0)) then v319=v175:sub(v179,v179);if (v319=="u") then local v331=0 + 0 ;local v332;while true do if (v331==(4 -3)) then v179=v179 +  #v332 ;break;end if (v331==(1453 -(28 + 1425))) then local v336=1993 -(941 + 1052) ;while true do if (v336==(2 -1)) then v331=1515 -(822 + 692) ;break;end if (v336==(1836 -(1045 + 791))) then v332=v175:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",v179 + (2 -1) ) or v175:match("^%x%x%x%x",v179 + (1 -0) ) or v35(v175,v179-(1 + 0) ,"invalid unicode escape in string") ;v178=v178   .. v37(v332) ;v336=1 + 0 ;end end end end else local v333=505 -(351 + 154) ;local v334;while true do if (v333==(1574 -(1281 + 293))) then v334=0 -0 ;while true do if (v334==(266 -(28 + 238))) then if  not v31[v319] then v35(v175,v179-1 ,"invalid escape char '"   .. v319   .. "' in string" );end v178=v178   .. v20[v319] ;break;end end break;end end end v318=4 -2 ;end if (v318==(1561 -(1381 + 178))) then v180=v179 + 1 + 0 ;break;end end elseif (v271==(71 -37)) then local v328=1963 -(556 + 1407) ;while true do if (v328==(0 + 0)) then v178=v178   .. v175:sub(v180,v179-(1 + 0) ) ;return v178,v179 + (3 -2) ;end end end v179=v179 + 1 + 0 ;end v177=2 + 0 ;end end end;local v39=function(v181,v182) local v183=470 -(381 + 89) ;local v184;local v185;local v186;while true do if (v183==(0 + 0)) then v184=v34(v181,v182,v30);v185=v181:sub(v182,v184-1 );v183=1 + 0 ;end if ((2 + 0)==v183) then return v186,v184;end if (v183==(1 -0)) then local v260=1230 -(957 + 273) ;while true do if (v260==(1157 -(1074 + 82))) then v183=1 + 1 ;break;end if (v260==(0 + 0)) then v186=tonumber(v185);if  not v186 then v35(v181,v182,"invalid number '"   .. v185   .. "'" );end v260=3 -2 ;end end end end end;local v40=function(v187,v188) local v189=0 -0 ;local v190;local v191;local v192;while true do if (v189==(0 -0)) then v190=1784 -(214 + 1570) ;v191=nil;v189=1456 -(990 + 465) ;end if (v189==(1 + 0)) then v192=nil;while true do local v272=0 + 0 ;while true do if (v272==(0 + 0)) then if (v190==(0 -0)) then v191=v34(v187,v188,v30);v192=v187:sub(v188,v191-(952 -(783 + 168)) );v190=3 -2 ;end if ((1727 -(1668 + 58))==v190) then if  not v32[v192] then v35(v187,v188,"invalid literal '"   .. v192   .. "'" );end return v33[v192],v191;end break;end end end break;end end end;local v41=function(v193,v194) local v195=311 -(309 + 2) ;local v196;local v197;local v198;while true do if (v195==(0 -0)) then v196=626 -(512 + 114) ;v197=nil;v195=2 -1 ;end if (v195==(1 -0)) then v198=nil;while true do if (v196==(0 -0)) then local v302=0 -0 ;while true do if (v302==(0 + 0)) then v197={};v198=1 + 0 ;v302=1 + 0 ;end if (v302==1) then v196=2 -1 ;break;end end end if (v196==(3 -2)) then v194=v194 + (1995 -(109 + 1885)) ;while 1470 -(1269 + 200)  do local v312;v194=v34(v193,v194,v29,true);if (v193:sub(v194,v194)=="]") then v194=v194 + (1 -0) ;break;end v312,v194=v27(v193,v194);v197[v198]=v312;v198=v198 + (816 -(98 + 717)) ;v194=v34(v193,v194,v29,true);local v314=v193:sub(v194,v194);v194=v194 + 1 ;if (v314=="]") then break;end if (v314~=",") then v35(v193,v194,"expected ']' or ','");end end v196=2;end if (v196==(828 -(802 + 24))) then return v197,v194;end end break;end end end;local v42=function(v199,v200) local v201=0 -0 ;local v202;while true do if ((1 + 0)==v201) then while 1 + 0  do local v273,v274;v200=v34(v199,v200,v29,true);if (v199:sub(v200,v200)=="}") then v200=v200 + (1 -0) ;break;end if (v199:sub(v200,v200)~='"') then v35(v199,v200,"expected string for key");end v273,v200=v27(v199,v200);v200=v34(v199,v200,v29,true);if (v199:sub(v200,v200)~=":") then v35(v199,v200,"expected ':' after key");end v200=v34(v199,v200 + (1 -0) ,v29,true);v274,v200=v27(v199,v200);v202[v273]=v274;v200=v34(v199,v200,v29,true);local v276=v199:sub(v200,v200);v200=v200 + 1 + 0 ;if (v276=="}") then break;end if (v276~=",") then v35(v199,v200,"expected '}' or ','");end end return v202,v200;end if (v201==(0 + 0)) then local v261=0 + 0 ;while true do if ((0 + 0)==v261) then v202={};v200=v200 + 1 + 0 ;v261=170 -(28 + 141) ;end if (v261==(1 + 0)) then v201=2 -1 ;break;end end end end end;local v43={['"']=v38,["0"]=v39,["1"]=v39,["2"]=v39,["3"]=v39,["4"]=v39,["5"]=v39,["6"]=v39,["7"]=v39,["8"]=v39,["9"]=v39,["-"]=v39,t=v40,f=v40,n=v40,["["]=v41,["{"]=v42};function v27(v203,v204) local v205=v203:sub(v204,v204);local v206=v43[v205];if v206 then return v206(v203,v204);end v35(v203,v204,"unexpected character '"   .. v205   .. "'" );end local v44=function(v207) local v208=0 + 0 ;local v209;local v210;while true do local v250=0 -0 ;while true do if (v250==(1 + 0)) then if (v208==(1 + 1)) then return v209;end break;end if (v250==(0 -0)) then if (v208==(3 -2)) then v210=v34(v207,v210,v29,true);if (v210<= #v207) then v35(v207,v210,"trailing garbage");end v208=2 + 0 ;end if (v208==(0 + 0)) then if (type(v207)~="string") then error("expected argument of type string, got "   .. type(v207) );end v209,v210=v27(v207,v34(v207,1 + 0 ,v29,true));v208=1;end v250=1434 -(797 + 636) ;end end end end;local v45,v46,v47=v26,v44,v17;local v48=3377;local v49="716da93b-2a37-4348-abff-3a457e896e0e";local v50=true;local v51=function(v211) end;repeat task.wait(4 -3 );until game:IsLoaded() local v52=false;local v53,v54,v55,v56,v57,v58,v59,v60,v61=setclipboard or toclipboard ,request or http_request or syn_request ,string.char,tostring,string.sub,os.time,math.random,math.floor,gethwid or function() return game:GetService("Players").LocalPlayer.UserId;end ;local v62,v63="",1619 -(1427 + 192) ;local v64="https://api.platoboost.com";local v65=v54({Url=v64   .. "/public/connectivity" ,Method="GET"});if ((v65.StatusCode~=(70 + 130)) or (v65.StatusCode~=(995 -566))) then v64="https://api.platoboost.net";end function cacheLink() if ((v63 + ((27 -17) * (54 + 6)))<v58()) then local v251=v54({Url=v64   .. "/public/start" ,Method="POST",Body=v45({service=v48,identifier=v47(v61())}),Headers={["Content-Type"]="application/json"}});if (v251.StatusCode==(91 + 109)) then local v277=v46(v251.Body);if (v277.success==true) then v62=v277.data.url;v63=v58();return true,v62;else local v304=326 -(192 + 134) ;while true do if (0==v304) then v51(v277.message);return false,v277.message;end end end elseif (v251.StatusCode==429) then local v305=1276 -(316 + 960) ;local v306;while true do if (v305==(0 + 0)) then v306="you are being rate limited, please wait 20 seconds and try again.";v51(v306);v305=1 + 0 ;end if (v305==(1 -0)) then return false,v306;end end end local v252="Failed to cache link.";v51(v252);return false,v252;else return true,v62;end end cacheLink();local v66=function() local v212=0 -0 ;local v213;while true do if (v212==(1 + 0)) then return v213;end if (v212==0) then v213="";for v278=119 -(88 + 30) ,60 -44  do v213=v213   .. v55(v60(v59() * (((673 -(83 + 468)) -97) + (1807 -(1202 + 604))) ) + (452 -355) ) ;end v212=1 + 0 ;end end end;for v214=1 -0 ,13 -8  do local v215=325 -(45 + 280) ;local v216;while true do if ((0 + 0)==v215) then local v262=439 -(397 + 42) ;while true do if ((1 + 0)==v262) then v215=801 -(24 + 776) ;break;end if (v262==(0 + 0)) then v216=v66();task.wait(0.2 + 0 );v262=1 + 0 ;end end end if (v215==(1 + 0)) then if (v66()==v216) then local v284=0;local v285;while true do if ((1 -0)==v284) then error(v285);break;end if (v284==0) then v285="platoboost nonce error.";v51(v285);v284=1 -0 ;end end end break;end end end local v67=function() local v217=1911 -(340 + 1571) ;local v218;local v219;while true do if (v217==(190 -(23 + 167))) then v218,v219=cacheLink();if v218 then v53(v219);end break;end end end;local v68=function(v220) local v221=v66();local v222=v64   .. "/public/redeem/"   .. v56(v48) ;local v223={identifier=v47(v61()),key=v220};if v50 then v223.nonce=v221;end local v224=v54({Url=v222,Method="POST",Body=v45(v223),Headers={["Content-Type"]="application/json"}});if (v224.StatusCode==(79 + 121)) then local v254=1772 -(1733 + 39) ;local v255;while true do if (v254==0) then v255=v46(v224.Body);if (v255.success==true) then if (v255.data.valid==true) then if v50 then if (v255.data.hash==v47("true"   .. "-"   .. v221   .. "-"   .. v49 )) then return true;else local v335=0 + 0 ;while true do if (v335==(0 -0)) then v51("failed to verify integrity.");return false;end end end else return true;end else local v325=1034 -(125 + 909) ;while true do if (v325==(1948 -(1096 + 852))) then local v330=0 + 0 ;while true do if (v330==(0 -0)) then v51("key is invalid.");return false;end end end end end elseif (v57(v255.message,1 + 0 ,15 + 12 )=="unique constraint violation") then v51("you already have an active key, please wait for it to expire before redeeming it.");return false;else local v326=0;local v327;while true do if ((512 -(409 + 103))==v326) then v327=236 -(46 + 190) ;while true do if (v327==(571 -(47 + 524))) then v51(v255.message);return false;end end break;end end end break;end end elseif (v224.StatusCode==(524 -(51 + 44))) then v51("you are being rate limited, please wait 20 seconds and try again.");return false;else v51("server returned an invalid status code, please try again later.");return false;end end;local v69=function(v225) local v226=0 + 0 ;local v227;local v228;local v229;while true do if ((1318 -(1114 + 203))==v226) then v228=v64   .. "/public/whitelist/"   .. v56(v48)   .. "?identifier="   .. v47(v61())   .. "&key="   .. v225 ;if v50 then v228=v228   .. "&nonce="   .. v227 ;end v226=2 -0 ;end if ((6 -3)==v226) then if (v229.StatusCode==(926 -(228 + 498))) then local v286=0 + 0 ;local v287;while true do if ((0 + 0)==v286) then v287=v46(v229.Body);if (v287.success==true) then if (v287.data.valid==true) then if v50 then if (v287.data.hash==v47("true"   .. "-"   .. v227   .. "-"   .. v49 )) then return true;else local v337=663 -(174 + 489) ;while true do if (v337==(0 -0)) then v51("failed to verify integrity.");return false;end end end else return true;end elseif (v57(v225,1906 -(830 + 1075) ,528 -(303 + 221) )=="KEY_") then return v68(v225);else v51("key is invalid.");return false;end else local v329=1269 -(231 + 1038) ;while true do if (v329==(479 -(341 + 138))) then v51(v287.message);return false;end end end break;end end elseif (v229.StatusCode==(358 + 71)) then local v315=1162 -(171 + 991) ;while true do if (v315==0) then v51("you are being rate limited, please wait 20 seconds and try again.");return false;end end else local v316=0 -0 ;while true do if ((0 -0)==v316) then v51("server returned an invalid status code, please try again later.");return false;end end end break;end if (v226==(0 -0)) then if (v52==true) then local v288=0 + 0 ;while true do if (v288==(881 -(581 + 300))) then v51("a request is already being sent, please slow down.");return false;end end else v52=true;end v227=v66();v226=1;end if (v226==(6 -4)) then v229=v54({Url=v228,Method="GET"});v52=false;v226=8 -5 ;end end end;local v70=function(v230) local v231=v66();local v232=v64   .. "/public/flag/"   .. v56(v48)   .. "?name="   .. v230 ;if v50 then v232=v232   .. "&nonce="   .. v231 ;end local v233=v54({Url=v232,Method="GET"});if (v233.StatusCode==(322 -122)) then local v256=v46(v233.Body);if (v256.success==true) then if v50 then if (v256.data.hash==v47(v56(v256.data.value)   .. "-"   .. v231   .. "-"   .. v49 )) then return v256.data.value;else v51("failed to verify integrity.");return nil;end else return v256.data.value;end else local v279=0;while true do if (v279==(0 + 0)) then v51(v256.message);return nil;end end end else return nil;end end; end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NoxsGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local ToggleButton = Instance.new("TextButton")
ToggleButton.Parent = ScreenGui
ToggleButton.Name = "ToggleButton"
ToggleButton.Text = "Toggle GUI"
ToggleButton.Size = UDim2.new(0, 150, 0, 50)
ToggleButton.Position = UDim2.new(0, 50, 0, 50)
ToggleButton.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 20
ToggleButton.Active = true
ToggleButton.Visible = true -- Ensure the button is visible

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 15)
ToggleCorner.Parent = ToggleButton

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 700, 0, 500)
MainFrame.Position = UDim2.new(0.5, -350, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(48, 25, 52)
MainFrame.Visible = false
MainFrame.ClipsDescendants = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 20)
MainCorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Text = "Nox's gui V2 😈"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(75, 0, 130)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24

local function AddFunctionButton(parent, label, position, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0.9, 0, 0, 40)
    Button.Position = position
    Button.Text = label
    Button.Font = Enum.Font.Gotham
    Button.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 14
    Button.Parent = parent
    Button.Visible = true -- Ensure buttons are visible

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 10)
    ButtonCorner.Parent = Button

    Button.MouseButton1Click:Connect(callback)
end

local function AnimateGUI(frame, isVisible)
    if isVisible then
        frame.Visible = true
        for i = 1, 10 do
            frame.BackgroundTransparency = 1 - (i * 0.1)
            wait(0.02)
        end
    else
        for i = 1, 10 do
            frame.BackgroundTransparency = i * 0.1
            wait(0.02)
        end
        frame.Visible = false
    end
end

ToggleButton.MouseButton1Click:Connect(function()
    AnimateGUI(MainFrame, not MainFrame.Visible)
end)

-- Add example buttons to the MainFrame to confirm functionality
AddFunctionButton(MainFrame, "Example Button 1", UDim2.new(0.05, 0, 0.1, 0), function()
    print("Button 1 clicked")
end)

AddFunctionButton(MainFrame, "Example Button 2", UDim2.new(0.05, 0, 0.2, 0), function()
    print("Button 2 clicked")
end)
