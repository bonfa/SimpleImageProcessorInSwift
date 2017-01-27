//: Playground - noun: a place where people can play

import UIKit


private func aFilterThatSwitchesTheValuesOfTheChannelsOfEachSinglePixel(image:UIImage!) {
    image
    
    let defaultModeFilterIs_RedToGreen_GreenToBlue_BlueToRed = SwitchChannelValuesFilter()
    defaultModeFilterIs_RedToGreen_GreenToBlue_BlueToRed.filter(image)
    
    let redToBlue_GreenToRed_BlueToGreen_Filter = SwitchChannelValuesFilter(mode: SwitchChannelValuesFilter.MODE.RED_TO_BLUE__GREEN_TO_RED__BLUE_TO_GREEN)
    redToBlue_GreenToRed_BlueToGreen_Filter.filter(image)
    
    let redToGreen_GreenToBlue_BlueToRed_Filter = SwitchChannelValuesFilter(mode: SwitchChannelValuesFilter.MODE.RED_TO_GREEN__GREEN_TO_BLUE__BLUE_TO_RED)
    redToGreen_GreenToBlue_BlueToRed_Filter.filter(image)
}

private func aMeanFilter(image:UIImage!) {
    image
    
    let defaultModeFilter_SizeIsThree = MeanFilter()
    defaultModeFilter_SizeIsThree.filter(image)
    
    let aMeanFilterWithSizeThree = MeanFilter(size: 9)
    aMeanFilterWithSizeThree.filter(image)
    
    let aMeanFilterWithSizeTwentyFive = MeanFilter(size: 25)
    aMeanFilterWithSizeTwentyFive.filter(image)
    
    let aMeanFilterWithSizeSeventyFive = MeanFilter(size: 75)
    aMeanFilterWithSizeSeventyFive.filter(image)
}

private func aFilterThatEnhanceOrReduceTheImageChannel(image:UIImage!) {
    image
    
    let defaultModeFilter_EnhanceRedChannelOfFifty = EnhanceReduceFilter()
    defaultModeFilter_EnhanceRedChannelOfFifty.filter(image)
    
    let aFilterThatEnhancesTheRedChannelOfFifty = EnhanceReduceFilter(redValue: 50, greenValue: 0, blueValue: 0)
    aFilterThatEnhancesTheRedChannelOfFifty.filter(image)
    
    let aFilterThatEnhancesTheGreenChannelOfOneHundred = EnhanceReduceFilter(redValue: 0, greenValue: 100, blueValue: 0)
    aFilterThatEnhancesTheGreenChannelOfOneHundred.filter(image)
    
    let aFilterThatReducesTheBlueChannelOfOEighty = EnhanceReduceFilter(redValue: 0, greenValue: 0, blueValue: -80)
    aFilterThatReducesTheBlueChannelOfOEighty.filter(image)
    
    let aFilterThatChangesAllTheChannels = EnhanceReduceFilter(redValue: -50, greenValue: 50, blueValue: 70)
    aFilterThatChangesAllTheChannels.filter(image)
}

private func aChainOfOneFilterBehavesAsTheSingleFilterItself(image:UIImage!) {
    image
    
    let filter = EnhanceReduceFilter(redValue: -50, greenValue: 50, blueValue: 70)
    filter.filter(image)
    
    let filterChain = ImageFilterChain(filter: filter)
    filterChain.apply(on: image)
}

private func aChainOfFiltersBehavesAsTheSequenceOfTheSingleFiltersApplied(image:UIImage!) {
    let filter1 = EnhanceReduceFilter(redValue: 0, greenValue: -10, blueValue: 0)
    let filter2 = EnhanceReduceFilter(redValue: 0, greenValue: 0, blueValue: 50)
    let filter3 = EnhanceReduceFilter(redValue: 20, greenValue: 0, blueValue: 0)
    
    image
    
    let singleFiltersAppliedOnImage = filter3.filter(filter2.filter(filter1.filter(image)))
    singleFiltersAppliedOnImage
    
    
    let filterChain = ImageFilterChain(filters:[filter1, filter2, filter3])
    filterChain.apply(on:image)
}

private func anArbitraryChainOfFilters(image:UIImage!) {
    image
    
    let filter1 = SwitchChannelValuesFilter()
    let filter2 = MeanFilter(size: 3)
    let filter3 = EnhanceReduceFilter(redValue: 0, greenValue: 50, blueValue: 0)
    let filter4 = EnhanceReduceFilter(redValue: 0, greenValue: 0, blueValue: 50)
    let filter5 = EnhanceReduceFilter(redValue: -50, greenValue: 0, blueValue: 0)
    
    let filterChain = ImageFilterChain(filters:[filter1, filter2, filter3, filter4, filter5])
    filterChain.apply(on:image)
}




/*
 *  MAIN
 *
 *
 */
let image = UIImage(named: "sample")

// Process the image!
if (image != nil) {
    aFilterThatSwitchesTheValuesOfTheChannelsOfEachSinglePixel(image)
    aMeanFilter(image)
    aFilterThatEnhanceOrReduceTheImageChannel(image)
    aChainOfOneFilterBehavesAsTheSingleFilterItself(image)
    aChainOfFiltersBehavesAsTheSequenceOfTheSingleFiltersApplied(image)
    anArbitraryChainOfFilters(image)
}
else {
    print("Image is null - nothing to do")
}

