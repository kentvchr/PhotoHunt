//
//  PhotoInformationsView.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

import SwiftUI

struct PhotoInformationsView: View {
    let photoDetails: PhotoDetails
    
    private var exifInfo: [(label: String, value: String)] {
        var info: [(String, String)] = []
        
        if let cameraModel = photoDetails.exif?.model {
            info.append(("Model", cameraModel))
        }
        if let aperture = photoDetails.exif?.aperture {
            info.append(("Aperture", "f/\(aperture)"))
        }
        if let focalLength = photoDetails.exif?.focalLength {
            info.append(("Focal Length", "\(focalLength) mm"))
        }
        if let iso = photoDetails.exif?.iso {
            info.append(("ISO", "\(iso)"))
        }
        if let shutterSpeed = photoDetails.exif?.exposureTime {
            info.append(("Shutter Speed", "\(shutterSpeed) s"))
        }
        return info
    }
    
    var body: some View {
        VStack(spacing: UIConstants.doublePadding) {
            generalInfoSectionView
            exifSectionView
        }.padding()
    }
    
    private var generalInfoSectionView: some View {
        VStack(alignment: .leading) {
            Text("Informations")
                .fontWeight(.semibold)
                .padding(.bottom, UIConstants.semiPadding)
            
            if let createdAt = photoDetails.createdAt.iso8601() {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Created at")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(createdAt)
                        .font(.caption)
                        .foregroundColor(.primary)
                }
            }
            
            if let location = photoDetails.location, let city = location.city, let country = location.country {
                    Text("\(city), \(country)" )
                        .font(.caption)
                        .foregroundColor(.primary)
            }
            
            Link(photoDetails.user.name, destination: photoDetails.user.links.html)
                .font(.caption)
                .foregroundColor(.blue)
                .underline()
                .padding(.top)
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var exifSectionView: some View {
        VStack(alignment: .leading) {
            Text("Camera")
                .fontWeight(.semibold)
                .padding(.bottom, UIConstants.semiPadding)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                ForEach(exifInfo, id: \.label) { item in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.label)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text(item.value)
                            .font(.caption)
                            .foregroundColor(.primary)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}

#Preview {
    PhotoInformationsView(photoDetails: PhotoDetails.mocked)
}

#Preview {
    NavigationStack {
        PhotoDetailsScreen(photo: Photo.mocked)
    }
}
