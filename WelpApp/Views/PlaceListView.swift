//
//  PlaceListView.swift
//  WelpApp
//
//  Created by Meeky Britanico on 2021-03-29.
//

import SwiftUI
import MapKit

struct PlaceListView: View {
    
    let landmarks: [Landmark]
    var onTap: () -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("tap here to see places")
                EmptyView()
            }.frame(width: UIScreen.main.bounds.size.width, height: 30)
            .background(Color.pink)
            .gesture(TapGesture()
                        .onEnded(self.onTap)
            )
            List {
                ForEach(self.landmarks, id: \.id) { landmark in
                    VStack(alignment: .leading) {
                        Text(landmark.name)
                            .fontWeight(.bold)
                        Text(landmark.title)
                    }
                }
            }.animation(nil)
        }.cornerRadius(10)
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView(landmarks: [Landmark(placemark: MKPlacemark())], onTap: {})
    }
}
