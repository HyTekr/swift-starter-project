//
//  CustomUIView+CollectionView.swift
//  Starter Project
//
//  Created by Oscar de la Hera Gomez on 3/12/23.
//

import Foundation
import UIKit

extension CustomUIView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    // MARK: Number of Sections & Items
    /*
     This function determines the number of sections in your collectionview.
     It's not required & it defaults to 1.
     */
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // There is only one section in this tutorial
        return 1
    }
    /*
     This function determines the number of items in your collectionview.
     It's required and there is no default.
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // In this tutorial, we will want to use the DataCoordinator PokemonV2Data count.
        return 100
    }

    // MARK: Cell
    /*
     This function gets called everytime a cell needs to be rendered.
     When the cell gets 'reused' it will first call 'prepareForReuse' - which is where you should clear your cell.
     Once it's reused, in this function, you can call functionality to tweak it to your desired visual.
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Get the Cell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DynamicLabelCell﻿.identifier, for: indexPath) as? DynamicLabelCell﻿, let currentContent = LanguageCoordinator.shared.currentContent else {
            return UICollectionViewCell()
        }
        // Set the initial variables
        let labelI: String = currentContent.sample.sampleString
        var labelII: String = ""
        var labelIII: String = ""
        // Update the cell so that if the cell in a sequence, its 1 label, 2 labels and 3 labels.
        // i.e. index 1: only 1 label. index 2: first and second label; and index 3: all three labels.
        if indexPath.row % 3 == 0 {
            labelII = currentContent.sample.sampleStringII
            labelIII = currentContent.sample.sampleStringIII
        } else if indexPath.row % 2 == 0 {
            labelII = currentContent.sample.sampleStringII
        }
        // Update the cell
        cell.update(labelI: labelI, labelII: labelII, labelIII: labelIII)

        // Return the cell
        return cell
    }

    // MARK: Visual Parameters
    /*
     This function determines the size of the cell for each given indexPath (i.e. section and row).
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Determine the frame
        let collectionViewFrame: CGRect = collectionView.frame
        // Return the size
        return CGSize(width: collectionViewFrame.width, height: 100)
    }

    /*
     This function determines the insets (also known as padding) for the collectionview.
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0
        )
    }

    /*
     This function determines the spacing between items within a section.
     */

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return kPadding
    }

    /*
     This function determines the spacing between sections.
     */

    func collectionView(_ collectionView: UICollectionView, layout
                            collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return kPadding
    }
}
