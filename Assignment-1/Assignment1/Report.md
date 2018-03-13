# Assignment 1
## Name: Sayak Kundu
## Roll Number: 20161035

### Question - 1
#### X = 2

1. **Original**

![Ellipse and polygon](test1.png)

**On expansion (Montage Mode)**
![Resized](montage.png)

*Note: Image is too big to fit on screen; displaying at 67%*

2. **Original**

![Cameraman](cameraman.png)

**On expansion (Montage Mode)**
![Resized](Screenshot_from_2018-01-17_09-49-57.png)

3. **Original**

![Coloured](dictionary-432043_1920s.jpg)

**On expansion (Montage Mode)**
![Resize](Screenshot_from_2018-01-17_11-41-40.png)

#### X = 5

1. **Original**

![Ellipse and polygon](test1.png)

**On expansion (Montage Mode)**
![Resized](montage1.png)

*Note: Image is too big to fit on screen; displaying at 67%*

2. **Original**

![Cameraman](cameraman.png)

**On expansion (Montage Mode)**
![Resized](Screenshot_from_2018-01-17_09-52-03.png)

3. **Original**

![Coloured](dictionary-432043_1920s.jpg)

**On expansion (Montage Mode)**
![Resize](Screenshot_from_2018-01-17_11-42-18.png)

#### Difference between Nearest neighbour interpolation and Bilinear interpolation

*Coloured*

![Difference Coloured](Screenshot_from_2018-01-17_11-42-30.png)

*Black and White*

![Difference Black and White](Screenshot_from_2018-01-17_09-52-00.png)

We can clearly see that the left image is more pixelated that the others in both the cases. The left uses **Nearest Neighbour Interpolation** for resizing whereas the right one uses **Bilinear Interpolation**.

Nearest Neighbour fairs equally or even better with images containing high number straight edges.

##### For example:

**Original**
![Plus](plus.png)

**X = 5 (Montage Mode)**
![Resize](Screenshot_from_2018-01-17_12-54-52.png)

**Comparison between Bilinear Interpolation and Nearest Neighbour Interpolation**

We see that both fair almost the same.

![NN vs BI](Screenshot_from_2018-01-17_12-54-45.png)

In Nearest Neighbour the pixel value of a pixel's nearest neighbour is copied to it. This may cause abrupt change in pixel values and thus give us pixelated images. This is good for pixelated art work.

##### For example: Transform a 3 X 3 matrix to 9 X 9 matrix using Nearest Neighbour

![Nearest Neighbour](IMG_20180117_122311766.jpg)

In Bilinear Interpolation we have some smoothness as it's somewhat based on your section formula. The pixel value of the nearest pixel will have more influence on it than the one farther away. But they both contribute to it.

##### For example: Transform a 3 X 3 matrix to 9 X 9 matrix using Bilinear Interpolation

![Bilinear Interpolation](IMG_20180117_122454926.jpg)

Nearest Neighbour Interpolation is faster than Bilinear Interpolation.

We can use **Bicubic Interpolation** for a better image than Nearest Neighbour or Bilinear Interpolation. It is smoother that both. Basically it uses a cubic equation for finding the pixel values.


### Question - 2

The given filter is an embossing filter.

**M** causes embossing. It also shows clearer picture of background as compared to **M' (M Transpose)**. M' shows clearer edges for the Cameraman in foreground. The vertical lines are better captured by M' than by M.

**Convolution with M**

![M](Screenshot_from_2018-01-17_13-06-20.png)

 **Convolution with M'**

 ![M'](Screenshot_from_2018-01-17_13-06-13.png)

**Comparison between M and M'**

![M vs M'](Screenshot_from_2018-01-17_13-06-07.png)


### Question - 3

1. Part 1

   **output_height = (height + 2 * (F - 1))/Z + 1**

   **output_width = (width + 2 * (F - 1))/Z + 1**

   **output_depth = N**

2. Part 2

   **Number of additions = (F * F - 1) * output_width * output_height**

   **Number of multiplications = F * F * output_width * output_height**

### Question - 4

Record your own voice



### Question - 5

The **3 X 3 Filter** is :

| 0      | 0      | 0      |
| ------ |:------:| ------:|
| **1**  | **1**  | **1**  |
| **-1** | **-1** | **-1** |

It's an Line detecting filter.

**Output**

![Sample_output](Screenshot_from_2018-01-17_13-31-59.png)

The filter and it's transpose are applied on blur.jpg

**Original**

![blur](blur.jpg)

**Convolution with filter**

![blur1](blur1.jpg)

**Convolution with transpose of filter**

![blur2](blur2.jpg)

**Adding blur1.jpg and blur2.jpg**

![blur_add](blur_add.jpg)

**3 more images**

**Original**

![Cameraman](cameraman.png)

**Using filter and it's transpose and adding them up**

![Result](Screenshot_from_2018-01-17_14-22-18.png)

**Original**

![Cartoon](dictionary-432043_1920s.jpg)

**Using filter and it's transpose and adding them up**

![Result](Screenshot_from_2018-01-17_14-28-15.png)

**Original**

![Plus](plus.png)

**Using filter and it's transpose and adding them up**

![Result](Screenshot_from_2018-01-17_14-29-59.png)

**M** detects the **horizontal edges** whereas **M'** detects **vertical edges**.


### Question - 6

Finding a sub image from a parent image by traversing and checking.

*Note: We are not allowed to use normxcorr2*

**Sub Image**

![F1](F1.jpg)

**Parent Image**

![Faces](Faces.jpg)

**Result**

![Find](find.jpg)

### Question - 7
