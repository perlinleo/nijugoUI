//
//  ProgressDot.swift
//  nijugoUI
//
//  Created by blacksnow on 6/19/25.
//

import SwiftUI

public struct ProgressDot: View {
    
    public enum Size {
        case L
        case M
        
        var size: CGFloat {
            switch self {
                case .L:
                    return 50
                case .M:
                    return 25
            }
        }
    }
    
    public enum Phase {
        case active
        case passed
        case wait
    }
    
    public var progress: CGFloat
    public var size: Size = .L
    public var phase: Phase = .passed
    
    private let gradient: Gradient = Gradient(colors: [Color.red, Color.black])
    
    @State private var pulse: Bool = false
    
    public var body: some View {
        Circle()
            .fill(
                LinearGradient(
                    gradient: gradient,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .opacity(opacity)
            .frame(width: size.size, height: size.size)
            .scaleEffect(combinedScale)
            .animation(.easeInOut(duration: 0.3), value: progress)
            .onChange(of: phase) { phase in
                if phase == .active {
                    startBounce()
                } else {
                    pulse = false
                }
            }
            .onAppear {
                if phase == .active {
                    startBounce()
                }
            }
            .animation(.easeInOut(duration: 0.3), value: progress)
    }
    
    private func startBounce() {
        withAnimation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true)) {
            pulse.toggle()
        }
    }
    
    private var opacity: Double {
        if phase == .wait { return 0.5 }
        if phase == .passed { return 1 }
        return pulse ? 1 : 0.7
    }
    
    private var scale: CGFloat {
        0.95 + progress * 0.05
    }
    
    private var combinedScale: CGFloat {
        scale * (pulse ? 1 : 0.97)
    }
}

#Preview {
    VStack(spacing: 16) {
        Text("Progress Dot Preview")
            .font(.headline)
        
        HStack(spacing: 24) {
            ProgressDot(progress: 0.0)
            ProgressDot(progress: 0.25)
            ProgressDot(progress: 0.5)
            ProgressDot(progress: 0.75, phase: .active)
            ProgressDot(progress: 1.0, phase: .wait)
        }
        .padding()
    }
}
