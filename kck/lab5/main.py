import skimage.io
import skimage.morphology
import skimage.filters
import skimage.segmentation
import skimage.color
import skimage.exposure
import skimage.feature
from matplotlib import pyplot as plt

def apply_filters(image, filters):
    image_ = image
    for f in filters:
        image_ = f(image_)

    return image_

images = skimage.io.ImageCollection('samoloty/samolot*.jpg')

filters = [
    skimage.color.rgb2gray,
    lambda x: skimage.feature.canny(x, sigma=3),
    skimage.morphology.dilation,
    skimage.morphology.dilation,
    skimage.morphology.dilation,
    skimage.morphology.dilation,
]

fig, axes = plt.subplots(3, 2, figsize=(8, 8))

for i, ax in enumerate(axes.flatten()):
    image = apply_filters(images[i], filters)
    ax.imshow(image, cmap=plt.cm.gray)
    ax.set_axis_off()
    plt.subplots_adjust(wspace=0, hspace=0)


fig.tight_layout()
plt.savefig("samoloty.png")
plt.show()

fig, axes = plt.subplots(3, 2, figsize=(8, 8))

for i, ax in enumerate(axes.flatten()):
    image = images[i]
    ax.imshow(image)
    ax.set_axis_off()
    plt.subplots_adjust(wspace=0, hspace=0)


fig.tight_layout()
plt.savefig("samoloty1.png")
plt.show()
