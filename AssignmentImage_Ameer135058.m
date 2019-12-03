%raed the all image that will be trainee

trainImg1=imread('A1.jpg');
trainImg2=imread('A2.jpg');
trainImg3=imread('A3.jpg');
trainImg4=imread('B1.jpg');
trainImg5=imread('B2.jpg');
trainImg6=imread('B3.jpg');
trainImg7=imread('C1.jpg');
trainImg8=imread('C2.jpg');
trainImg9=imread('C3.jpg');  

%convert the trainning images to gray scale
img1Gray1=rgb2gray(trainImg1);
img1Gray2=rgb2gray(trainImg2);
img1Gray3=rgb2gray(trainImg3);
img1Gray4=rgb2gray(trainImg4);
img1Gray5=rgb2gray(trainImg5);
img1Gray6=rgb2gray(trainImg6);
img1Gray7=rgb2gray(trainImg7);
img1Gray8=rgb2gray(trainImg8);
img1Gray9=rgb2gray(trainImg9);

%transform the image to double
fourierTransform1=fft2(double(img1Gray1));
% take the absoulute value after fourier transform to ignore negative if
% founded
featuresOfImg1=abs(fourierTransform1(:));
%sort the the frequency of the image in descending order
featuresOfImg1=sort(featuresOfImg1,'descend');
% take the highest three frequency
featuresOfImg1=featuresOfImg1(1:3);

fourierTransform2=fft2(double(img1Gray2));
featuresOfImg2=abs(fourierTransform2(:));
featuresOfImg2=sort(featuresOfImg2,'descend');
featuresOfImg2=featuresOfImg2(1:3);

fourierTransform3=fft2(double(img1Gray3));
featuresOfImg3=abs(fourierTransform3(:));
featuresOfImg3=sort(featuresOfImg3,'descend');
featuresOfImg3=featuresOfImg3(1:3);

fourierTransform4=fft2(double(img1Gray4));
featuresOfImg4=abs(fourierTransform4(:));
featuresOfImg4=sort(featuresOfImg4,'descend');
featuresOfImg4=featuresOfImg4(1:3);

fourierTransform5=fft2(double(img1Gray5));
featuresOfImg5=abs(fourierTransform5(:));
featuresOfImg5=sort(featuresOfImg5,'descend');
featuresOfImg5=featuresOfImg5(1:3);

fourierTransform6=fft2(double(img1Gray6));
featuresOfImg6=abs(fourierTransform6(:));
featuresOfImg6=sort(featuresOfImg6,'descend');
featuresOfImg6=featuresOfImg6(1:3);

fourierTransform7=fft2(double(img1Gray7));
featuresOfImg7=abs(fourierTransform7(:));
featuresOfImg7=sort(featuresOfImg7,'descend');
featuresOfImg7=featuresOfImg7(1:3);

fourierTransform8=fft2(double(img1Gray8));
featuresOfImg8=abs(fourierTransform8(:));
featuresOfImg8=sort(featuresOfImg8,'descend');
featuresOfImg8=featuresOfImg8(1:3);

fourierTransform9=fft2(double(img1Gray9));
featuresOfImg9=abs(fourierTransform9(:));
featuresOfImg9=sort(featuresOfImg9,'descend');
featuresOfImg9=featuresOfImg9(1:3);

%save the images with the first thre frequency for each image into array
features=[featuresOfImg1,featuresOfImg2,featuresOfImg3,featuresOfImg4,featuresOfImg5,featuresOfImg6,featuresOfImg7,featuresOfImg8,featuresOfImg9];

testImg=imread('Sample.jpg');
imgGray=rgb2gray(testImg);
filteredImg=medfilt2(imgGray);
sampleImg=imcomplement(filteredImg);

fourierTransformSampleImg=fft2(double(sampleImg));
sampleImagefeatures=abs(fourierTransformSampleImg(:));
sampleImagefeatures=sort(sampleImagefeatures,'descend');
sampleImagefeatures=sampleImagefeatures(1:3);
% the DC value for the sample image is 436178
%sampleImagefeatures=sampleImagefeatures(1);

%use K-nearest neighbour algorithm to classify the sample image
for i=1:9
nearest(i)=sqrt((sampleImagefeatures(1)-features(1,i))^2+(sampleImagefeatures(2)-features(2,i))^2+(sampleImagefeatures(3)-features(3,i))^2);
end

[M,I]=min(nearest);