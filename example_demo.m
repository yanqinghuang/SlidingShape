% In this demo code will load one examplar model and test it on 3 image
% show the top 3 detections 
% For examples to train and test the full set of models, see full_demo.m
clear all;
close all;

initPath;
[svmpara,featurepara]=setParameters(); % set paramter

Allsvm ={'../preTrainedModels/chair/chair/chair_000000358/chair_000000358_r0.3_s1_d2_t-0.25_x0.3_h-0.9_sft000_asp111.mat'};

drawfigure =1;
outpathTest ='';
imageID = [1044,611];
replace =0;

for  i =imageID,  
     TestingSingleImage_test(outpathTest,i,Allsvm,featurepara,drawfigure,replace,featurepara.localsearch);
end  

% show the model
offfile =  '../offData/chair/chair_000000358/chair_000000358.off'
load(Allsvm{1});
depth  = off2im_sys(offfile,1,Model.Rotation*pi,Model.Tilt,Model.Cx,Model.Cdepth,Model.Cheight,[1;1;1]*Model.Scale,1,0.1,0);
figure,
imagesc(depth);
print('depthImage','-dpng')
title('The depth map of this examplar')
