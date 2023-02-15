//
//  VideoListView.swift
//  Africa
//
//  Created by Arthur on 30/01/2023.
//

import SwiftUI

struct VideoListView: View {
    //MARK: - PROPERTIES
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
//            List {
//                ForEach(videos) { item in
//                    VideoListItemView(video: item)
//                        .padding(.vertical, 8)
//                } //:List
//            } //:List
            List(videos) { video in
                NavigationLink(destination: VideoPlayerView(videoSelected: video.id, videoTitle: video.name)) {
                    VideoListItemView(video: video)
                        .padding(.vertical, 8)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Videos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }


                }
            }
        } //:NavigationView
    }
}

//MARK: - PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
