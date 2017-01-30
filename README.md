# Simple Image Processor In Swift
The project consists in doing some simple image processing on a default image. Starting from a already present class, _RGBAImage_, that allows simple operations on an image, some basic filters have been created with which process the image.
This is the assignment of the course [Introduction To Swift Programming](https://www.coursera.org/learn/swift-programming/) by University of Toronto, available on Coursera.

**Requirements of the project:**
- Be able to apply a filter formula to each pixel of the image.
- The formula should have parameters that can be modified so that the filter can have a small or large effect on the image.
- Be able to apply several different filters to the image, in a specific order (e.g. a ‘pipeline of filters’). These could be different formulas (e.g. brightness vs. contrast) or could be the same formula with different parameters.
- Have some method or interface to apply default filter formulas and parameters that can be accessed by name.