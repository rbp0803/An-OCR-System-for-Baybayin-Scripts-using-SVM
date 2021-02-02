%============================================================ %
%This function generates multiclass SVM models in classifying %
%26 Latin characters                                          %  
%------------------------------------------------------------ %
%load each dataset for 26 Latin characters
% houldout $\in$ [0,1] = Randomly select and reserve p*100% of the data as 
%                      validation data, and train the model using the rest of the data.
% s = number of runs
%k = misclassfication rate in ith iteration
%mean_k = mean of k
% label = predicted label at the last iteration
% y1 = true label at the last iteration
function [k, mean_k, label_cell, y1_cell,kFoldLoss,SVMModels,crossval_SVM]=data_traintest3_multiclass_26classes_v2_revised_latin(data_traintest1,data_traintest2,...
            data_traintest3,data_traintest4,data_traintest5,data_traintest6,data_traintest7, data_traintest8,...
            data_traintest9, data_traintest10, data_traintest11, data_traintest12, data_traintest13,...
            data_traintest14, data_traintest15, data_traintest16, data_traintest17, data_traintest18,data_traintest19,...
            data_traintest20, data_traintest21, data_traintest22, data_traintest23, data_traintest24,...
            data_traintest25, data_traintest26, holdout, s)

rng('shuffle')
 

[row1, col1]=size(data_traintest1);
[row2, col2]=size(data_traintest2);
[row3, col3]=size(data_traintest3);
[row4, col4]=size(data_traintest4);
[row5, col5]=size(data_traintest5);
[row6, col6]=size(data_traintest6);
[row7, col7]=size(data_traintest7);
[row8, col8]=size(data_traintest8);
[row9, col9]=size(data_traintest9);
[row10,col10]=size(data_traintest10);
[row11,col11]=size(data_traintest11);
[row12,col12]=size(data_traintest12);
[row13, col13]=size(data_traintest13);
[row14, col14]=size(data_traintest14);
[row15, col15]=size(data_traintest15);
[row16, col16]=size(data_traintest16);
[row17, col17]=size(data_traintest17);
[row18, col18]=size(data_traintest18);
[row19, col19]=size(data_traintest19);
[row20, col20]=size(data_traintest20);
[row21, col21]=size(data_traintest21);
[row22, col22]=size(data_traintest22);
[row23, col23]=size(data_traintest23);
[row24, col24]=size(data_traintest24);
[row25, col25]=size(data_traintest25);
[row26, col26]=size(data_traintest26);


    H01=round(row1*(1-holdout));
    H02=round(row2*(1-holdout));
    H03=round(row3*(1-holdout));
    H04=round(row4*(1-holdout));
    H05=round(row5*(1-holdout));
    H06=round(row6*(1-holdout));
    H07=round(row7*(1-holdout));
    H08=round(row8*(1-holdout));
    H09=round(row9*(1-holdout));
    H10=round(row10*(1-holdout));
    H11=round(row11*(1-holdout));
    H12=round(row12*(1-holdout));
    H13=round(row13*(1-holdout));
    H14=round(row14*(1-holdout));
    H15=round(row15*(1-holdout));
    H16=round(row16*(1-holdout));
    H17=round(row17*(1-holdout));
    H18=round(row18*(1-holdout));
    H19=round(row19*(1-holdout));
    H20=round(row20*(1-holdout));
    H21=round(row21*(1-holdout));
    H22=round(row22*(1-holdout));
    H23=round(row23*(1-holdout));
    H24=round(row24*(1-holdout));
    H25=round(row25*(1-holdout));
    H26=round(row26*(1-holdout));
    
    

data1=zeros(H01,col1);
data2=zeros(H02,col2);
data3=zeros(H03,col3);
data4=zeros(H04,col4);
data5=zeros(H05,col5);
data6=zeros(H06,col6);
data7=zeros(H07,col7);
data8=zeros(H08,col8);
data9=zeros(H09,col9);
data10=zeros(H10,col10);
data11=zeros(H11,col11);
data12=zeros(H12,col12);
data13=zeros(H13,col13);
data14=zeros(H14,col14);
data15=zeros(H15,col15);
data16=zeros(H16,col16);
data17=zeros(H17,col17);
data18=zeros(H18,col18);
data19=zeros(H19,col19);
data20=zeros(H20,col20);
data21=zeros(H21,col21);
data22=zeros(H22,col22);
data23=zeros(H23,col23);
data24=zeros(H24,col24);
data25=zeros(H25,col25);
data26=zeros(H26,col26);


test1=zeros(row1-H01,col1);
test2=zeros(row2-H02,col2);
test3=zeros(row3-H03,col3);
test4=zeros(row4-H04,col4);
test5=zeros(row5-H05,col5);
test6=zeros(row6-H06,col6);
test7=zeros(row7-H07,col7);
test8=zeros(row8-H08,col8);
test9=zeros(row9-H09,col9);
test10=zeros(row10-H10,col10);
test11=zeros(row11-H11,col11);
test12=zeros(row12-H12,col12);
test13=zeros(row13-H13,col13);
test14=zeros(row14-H14,col14);
test15=zeros(row15-H15,col15);
test16=zeros(row16-H16,col16);
test17=zeros(row17-H17,col17);
test18=zeros(row18-H18,col18);
test19=zeros(row19-H19,col19);
test20=zeros(row20-H20,col20);
test21=zeros(row21-H21,col21);
test22=zeros(row22-H22,col22);
test23=zeros(row23-H23,col23);
test24=zeros(row24-H24,col24);
test25=zeros(row25-H25,col25);
test26=zeros(row26-H26,col26);



[Row1, Col1]=size(test1);
[Row2, Col2]=size(test2);
[Row3, Col3]=size(test3);
[Row4, Col4]=size(test4);
[Row5, Col5]=size(test5);
[Row6, Col6]=size(test6);
[Row7, Col7]=size(test7);
[Row8, Col8]=size(test8);
[Row9, Col9]=size(test9);
[Row10, Col10]=size(test10);
[Row11, Col11]=size(test11);
[Row12, Col12]=size(test12);
[Row13, Col13]=size(test13);
[Row14, Col14]=size(test14);
[Row15, Col15]=size(test15);
[Row16, Col16]=size(test16);
[Row17, Col17]=size(test17);
[Row18, Col18]=size(test18);
[Row19, Col19]=size(test19);
[Row20, Col20]=size(test20);
[Row21, Col21]=size(test21);
[Row22, Col22]=size(test2);
[Row23, Col23]=size(test23);
[Row24, Col24]=size(test24);
[Row25, Col25]=size(test25);
[Row26, Col26]=size(test26);



k=zeros(s,1);
kFoldLoss=zeros(s,1);

SVMModels=cell(s,1);
crossval_SVM=cell(s,1);
y1_cell=cell(s,1);
label_cell=cell(s,1);

for j=1:s
    
rand01=randperm(row1);
rand02=randperm(row2);
rand03=randperm(row3);
rand04=randperm(row4);
rand05=randperm(row5);
rand06=randperm(row6);
rand07=randperm(row7);
rand08=randperm(row8);
rand09=randperm(row9);
rand10=randperm(row10);
rand11=randperm(row11);
rand12=randperm(row12);
rand13=randperm(row13);
rand14=randperm(row14);
rand15=randperm(row15);
rand16=randperm(row16);
rand17=randperm(row17);
rand18=randperm(row18);
rand19=randperm(row19);
rand20=randperm(row20);
rand21=randperm(row21);
rand22=randperm(row22);
rand23=randperm(row23);
rand24=randperm(row24);
rand25=randperm(row25);
rand26=randperm(row26);

    data1=data_traintest1(rand01(1:H01),:);
    test1=data_traintest1(rand01(H01+1:row1),:);

    data2=data_traintest2(rand02(1:H02),:);
    test2=data_traintest2(rand02(H02+1:row2),:);
    
    data3=data_traintest3(rand03(1:H03),:);
    test3=data_traintest3(rand03(H03+1:row3),:);
    
    data4=data_traintest4(rand04(1:H04),:);
    test4=data_traintest4(rand04(H04+1:row4),:);
    
    data5=data_traintest5(rand05(1:H05),:);
    test5=data_traintest5(rand05(H05+1:row5),:);

    data6=data_traintest6(rand06(1:H06),:);
    test6=data_traintest6(rand06(H06+1:row6),:);
    
    data7=data_traintest7(rand07(1:H07),:);
    test7=data_traintest7(rand07(H07+1:row7),:);
    
    data8=data_traintest8(rand08(1:H08),:);
    test8=data_traintest8(rand08(H08+1:row8),:);
    
    data9=data_traintest9(rand09(1:H09),:);
    test9=data_traintest9(rand09(H09+1:row9),:);
    
    data10=data_traintest10(rand10(1:H10),:);
    test10=data_traintest10(rand10(H10+1:row10),:);
    
    data11=data_traintest11(rand11(1:H11),:);
    test11=data_traintest11(rand11(H11+1:row11),:);
    
    data12=data_traintest12(rand12(1:H12),:);
    test12=data_traintest12(rand12(H12+1:row12),:);
    
    data13=data_traintest13(rand13(1:H13),:);
    test13=data_traintest13(rand13(H13+1:row13),:);
    
    data14=data_traintest14(rand14(1:H14),:);
    test14=data_traintest14(rand14(H14+1:row14),:);
    
    data15=data_traintest15(rand15(1:H15),:);
    test15=data_traintest15(rand15(H15+1:row15),:);
    
    data16=data_traintest16(rand16(1:H16),:);
    test16=data_traintest16(rand16(H16+1:row16),:);
    
    data17=data_traintest17(rand17(1:H17),:);
    test17=data_traintest17(rand17(H17+1:row17),:);
    
    data18=data_traintest18(rand18(1:H18),:);
    test18=data_traintest18(rand09(H18+1:row18),:);
    
    data19=data_traintest19(rand19(1:H19),:);
    test19=data_traintest19(rand19(H19+1:row19),:);
    
    data20=data_traintest20(rand20(1:H20),:);
    test20=data_traintest20(rand20(H20+1:row20),:);
    
    data21=data_traintest21(rand21(1:H21),:);
    test21=data_traintest21(rand21(H21+1:row21),:);
    
    data22=data_traintest22(rand22(1:H22),:);
    test22=data_traintest22(rand22(H22+1:row22),:);
    
    data23=data_traintest23(rand23(1:H23),:);
    test23=data_traintest23(rand23(H23+1:row23),:);
    
    data24=data_traintest24(rand24(1:H24),:);
    test24=data_traintest24(rand24(H24+1:row24),:);
    
    data25=data_traintest25(rand25(1:H25),:);
    test25=data_traintest25(rand25(H25+1:row25),:);
    
    data26=data_traintest26(rand26(1:H26),:);
    test26=data_traintest26(rand26(H26+1:row26),:);
    
    
data0=cat(1,data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,...
          data15,data16,data17,data18,data19,data20,data21,data22,data23,data24,data25,data26);
      
data0=single(data0);

test0=cat(1,test1,test2,test3,test4,test5,test6,test7,test8,test9,test10,test11,test12,test13,test14,test15,test16,test17,...
          test18, test19, test20, test21, test22, test23, test24, test25, test26);
test0=single(test0);

[row, col]=size(data0);

P=randperm(row);

DATA_Train=zeros(row,col);
DATA_Train=data0(P(:),:);

y=zeros(row,1);

for i=1:row 
if P(i)<= H01
    y(i)=1;
    
elseif P(i)>H01 && P(i)<=H01+H02
    y(i)=2;
    
elseif P(i)>H01+H02 && P(i)<=H01+H02+H03
    y(i)=3;
    
elseif P(i)>H01+H02+H03 && P(i)<=sum([H01 H02 H03 H04])
    y(i)=4;
    
elseif P(i)>sum([H01 H02 H03 H04]) && P(i)<=sum([H01 H02 H03 H04 H05]) 
    y(i)=5;
    
elseif P(i)>sum([H01 H02 H03 H04 H05]) && P(i)<=sum([H01 H02 H03 H04 H05 H06])    
    y(i)=6;
    
elseif P(i)>sum([H01 H02 H03 H04 H05 H06]) && P(i)<=sum([H01 H02 H03 H04 H05 H06 H07])  
    y(i)=7;
    
elseif P(i)>sum([H01 H02 H03 H04 H05 H06 H07]) && P(i)<=sum([H01 H02 H03 H04 H05 H06 H07 H08])
    y(i)=8;
    
elseif P(i)>sum([H01 H02 H03 H04 H05 H06 H07 H08]) && P(i)<=sum([H01 H02 H03 H04 H05 H06 H07 H08 H09])
    y(i)=9;
    
elseif P(i)>sum([H01 H02 H03 H04 H05 H06 H07 H08 H09]) && P(i)<=sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10]) 
    y(i)=10;
    
elseif P(i)>sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10]) && P(i)<=sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11])  
    y(i)=11;
    
elseif P(i)>sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11]) && P(i)<=sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12])
    y(i)=12;
    
elseif P(i)>sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12]) && P(i)<=sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13])
    y(i)=13;
    
elseif P(i)>sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13]) && P(i)<=sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14])
    y(i)=14;
    
elseif P(i)>sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14]) && P(i)<=sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15])
    y(i)=15;
    
elseif P(i)>sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15]) && P(i)<=sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16])
    y(i)=16;
    

elseif P(i)>sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16]) && P(i)<=sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H17])
    y(i)=17;
    
elseif P(i)>sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H17]) && P(i)<=sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H17 H18])    
    y(i)=18;
    
elseif P(i)>sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H17 H18]) && P(i)<=sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19])    
    y(i)=19;    
    
elseif P(i)>sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19]) && P(i)<=sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20])    
    y(i)=20;    
    
elseif P(i)>sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20]) && P(i)<=sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20 H21])    
    y(i)=21;    
    
elseif P(i)>sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20 H21]) && P(i)<=sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20 H21 H22])    
    y(i)=22;    
    
elseif P(i)>sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20 H21 H22]) && P(i)<=sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20 H21 H22 H23])    
    y(i)=23;
    
elseif P(i)>sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20 H21 H22 H23]) && P(i)<=sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20 H21 H22 H23 H24])    
    y(i)=24;
    
elseif P(i)>sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20 H21 H22 H23 H24]) && P(i)<=sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20 H21 H22 H23 H24 H25])    
    y(i)=25;    
    
elseif P(i)>sum([H01 H02 H03 H04 H05 H06 H07 H08 H09 H10 H11 H12 H13 H14 H15 H16 H17 H18 H19 H20 H21 H22 H23 H24 H25])   
    y(i)=26;    
            
end

end
   
tic; 

t = templateSVM('Standardize',true,'KernelFunction','rbf','Kernelscale','auto','Boxconstraint',Inf);

cl2= fitcecoc(DATA_Train,y,'Learners',t,'FitPosterior',true');

SVMModels{j}=cl2;
%see-ell
cl=crossval(cl2,'Holdout',0.01);
toc;

Trained_cl=cl.Trained{1};
crossval_SVM{j}=Trained_cl;

kFoldLoss(j)=kfoldLoss(cl);

[row0, col0]=size(test0);
PP=randperm(row0);

Xtest=zeros(row0,col0);
Xtest=test0(PP(:),:);

y1=zeros(row0,1);

for ii=1:row0 
if PP(ii)<= Row1
    y1(ii)=1;
    
elseif PP(ii)>Row1 && PP(ii)<=Row1+Row2
    y1(ii)=2;
    
elseif PP(ii)>Row1+Row2 && PP(ii)<=Row1+Row2+Row3
    y1(ii)=3;
    
elseif PP(ii)>Row1+Row2+Row3 && PP(ii)<=Row1+Row2+Row3+Row4
    y1(ii)=4;
    
elseif PP(ii)>Row1+Row2+Row3+Row4 && PP(ii)<=sum([Row1 Row2 Row3 Row4 Row5])
    y1(ii)=5;
    
elseif PP(ii)>sum([Row1 Row2 Row3 Row4 Row5]) && PP(ii)<=sum([Row1 Row2 Row3 Row4 Row5 Row6])
    y1(ii)=6;
    
elseif PP(ii)>sum([Row1 Row2 Row3 Row4 Row5 Row6]) && PP(ii)<=sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7])
    y1(ii)=7;
    
elseif PP(ii)>sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7]) && PP(ii)<=sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8]) 
    y1(ii)=8;
    
elseif PP(ii)>sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8]) && PP(ii)<=sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9]) 
    y1(ii)=9;
    
elseif PP(ii)>sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9]) && PP(ii)<=sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10])
    y1(ii)=10;
  
elseif PP(ii)>sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10]) && PP(ii)<=sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11])
    y1(ii)=11;
    
elseif PP(ii)>sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11]) && PP(ii)<=sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12])
    y1(ii)=12;
    
elseif PP(ii)>sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12]) && PP(ii)<=sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13])    
    y1(ii)=13;
    
elseif PP(ii)>sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13]) && PP(ii)<=sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14])
    y1(ii)=14;
    
elseif PP(ii)>sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14]) && PP(ii)<=sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15])
    y1(ii)=15;
    
elseif PP(ii)>sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15]) && PP(ii)<=sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15 Row16])
    y1(ii)=16;
    
elseif PP(ii)>sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15 Row16]) && PP(ii)<=sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15 Row16 Row17])
    y1(ii)=17;
    
elseif PP(ii)>sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15 Row16 Row17]) && PP(ii)<=sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15 Row16 Row17 Row18])
    y1(ii)=18;

elseif PP(ii)>sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15 Row16 Row17 Row18]) && PP(ii)<=sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15 Row16 Row17 Row18 Row19])
    y1(ii)=19;

elseif PP(ii)>sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15 Row16 Row17 Row18 Row19]) && PP(ii)<=sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15 Row16 Row17 Row18 Row19 Row20])
    y1(ii)=20;
    
elseif PP(ii)>sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15 Row16 Row17 Row18 Row19 Row20]) && PP(ii)<=sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15 Row16 Row17 Row18 Row19 Row20 Row21])
    y1(ii)=21;
 
elseif PP(ii)>sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15 Row16 Row17 Row18 Row19 Row20 Row21]) && PP(ii)<=sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15 Row16 Row17 Row18 Row19 Row20 Row21 Row22])
    y1(ii)=22;    
    
elseif PP(ii)>sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15 Row16 Row17 Row18 Row19 Row20 Row21 Row22]) && PP(ii)<=sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15 Row16 Row17 Row18 Row19 Row20 Row21 Row22 Row23])
    y1(ii)=23;    
    
elseif PP(ii)>sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15 Row16 Row17 Row18 Row19 Row20 Row21 Row22 Row23]) && PP(ii)<=sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15 Row16 Row17 Row18 Row19 Row20 Row21 Row22 Row23 Row24])
    y1(ii)=24;
    
elseif PP(ii)>sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15 Row16 Row17 Row18 Row19 Row20 Row21 Row22 Row23 Row24]) && PP(ii)<=sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15 Row16 Row17 Row18 Row19 Row20 Row21 Row22 Row23 Row24 Row25])
    y1(ii)=25;    
    
elseif PP(ii)>sum([Row1 Row2 Row3 Row4 Row5 Row6 Row7 Row8 Row9 Row10 Row11 Row12 Row13 Row14 Row15 Row16 Row17 Row18 Row19 Row20 Row21 Row22 Row23 Row24 Row25])
    y1(ii)=26;    
    
end
end
y1_cell{j}=y1;


[label,~,~,Posterior]=predict(Trained_cl,Xtest);
label_cell{j}=label;

mis =label~=y1;
mis_rate=sum(mis)/length(y1);
k(j)=mis_rate;
end
mean_k=mean(k);
end
