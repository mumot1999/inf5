# from skimage import data, io, filters, morphology
import skimage.io
import skimage.morphology
import skimage.filters
import skimage.segmentation
import skimage.color
import skimage.exposure
from matplotlib import pyplot as plt

def apply_filters(image, filters):
    image_ = image
    for f in filters:
        image_ = f(image_)

    return image_

images = skimage.io.ImageCollection('samoloty/samolot*.jpg')
# image = skimage.io.imread("samoloty/samolot00.jpg")

filters = [
    skimage.color.rgb2gray,
    # skimage.color.rgb2gray,
    skimage.morphology.erosion,
    # skimage.morphology.erosion,
    skimage.filters.sobel,
    skimage.morphology.dilation,
    # skimage.filters.threshold_multiotsu
    # skimage.morphology.dilation,
    # skimage.morphology.dilation,

    # skimage.morphology.erosion,
    # skimage.morphology.dilation,
]

fig, axes = plt.subplots(3, 2, figsize=(8, 8))

for i, ax in enumerate(axes.flatten()):
    image = apply_filters(images[i], filters)
    thresh = skimage.filters.threshold_otsu(image)
    binary = image > thresh
    ax.imshow(image, cmap=plt.cm.gray)
    ax.set_axis_off()
    plt.subplots_adjust(wspace=0, hspace=0)


fig.tight_layout()
plt.savefig("samoloty.png")
plt.show()
