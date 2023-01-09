//
//  SnapshottingExtension.swift
//  TestKit
//
//  Created by Mariusz Sut on 07/04/2022.
//

import SnapshotTesting
import SwiftUI
import UIKit

extension Snapshotting where Value: SwiftUI.View, Format == UIImage {
    public static func standardImage(size: CGSize = CGSize(width: 375, height: 0),
                                     mode: UIUserInterfaceStyle = .light) -> Snapshotting {
        .image(drawHierarchyInKeyWindow: true,
               precision: 0.99,
               layout: .fixed(width: size.width, height: size.height),
               traits: UITraitCollection(userInterfaceStyle: mode))
    }
}
