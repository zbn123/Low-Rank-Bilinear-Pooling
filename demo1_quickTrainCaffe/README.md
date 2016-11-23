### This is the first demo about quick training of our low-rank bilinear pooling model.

Please note that the configuration for this demo is not exactly the same as our model described in the paper. I haven't implemented it in caffe, while caffe runs faster than matconvnet. Strictly speaking, this is an implementation on the classifier co-decomposition and full-rank linear SVM on the bilinear feature on low-dimensional subspace. This demo gives you an idea that good performance can be achieved by projecting features onto low-dimensional subspace (derived from classifier co-decomposition).


The dataset used here is the bird one CUB-200-2011. So downloading the dataset, making a dataset ".mat" file is a must-do step. Please refer to Tsung-Yu's Bilinear CNN or Yang's Compact Bilinear Pooling for how to download and make the file. I will also make a guide later.

There are two "main" files --
	1. main000 -- generating training and testing lists for caffe
	2. main001 -- feeding training images to a base CNN model, 
			obtaining the activations, 
			using PCA to decompose the activations, 
			initializing P,
			and save the initialized model.

The matlab files above will generate all the intermediate files/models for training. But if, in case, there is bug or you can't run it, please let me know, go to the model repository at [google drive](https://drive.google.com/open?id=0BxeylfSgpk1MOWt3U1U4WWdmSkk) to download some basic models generated by those files, and put the models and 'mat' files in this folder.

	
Running "nohup.sh" will train last layer, and fine-tuning the whole model. 
You are highly recommended to go through the "prototxt", "solver" and "sh" files.
After training, you can use command "python drawTrainCurve.py trainBird.log" to plot the training curve.
Through all these, I get two plots --
	* trainBird.log.jpg 	-- for training laster layer
	* trainBird_All.log.jpg	-- for fine-tuning the whole model

The performance should be around 83.5% accuracy. To improve the performance a bit, you can consider augmenting training data through random scaling/cropping/rotation, and also augment testing images and averaging the score for each testing image.

Laster update: 11/22/2016
Shu Kong 
aimerykong attt gmail dot commmmmm




