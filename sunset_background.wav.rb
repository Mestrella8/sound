# Set Up the Section Control
set :section, 1

live_loop :section_control do
  section = get[:section]
  
  case section
  when 1
    cue :section3
  when 2
    cue :section2
  when 3
    cue :section1
  end
  
  sleep 1
end

# Section 1 Live Loops
live_loop :low_notes1 do
  sync :section1
  use_synth :hollow
  with_fx :reverb, room: 1, mix: 0.7 do
    with_fx :echo, phase: 0.75, decay: 8 do
      play choose([:e2, :f2, :g2, :a2]), attack: 3, sustain: 8, release: 5, cutoff: rrand(60, 100), amp: 0.2
    end
  end
  sleep choose([16, 20, 24])
end

live_loop :melody1 do
  sync :section1
  use_synth :blade
  with_fx :flanger, depth: 1, mix: 0.3 do
    with_fx :echo, phase: 0.5, decay: 4 do
      play (scale :e4, :minor_pentatonic).choose, attack: 1.5, sustain: 3, release: 2, amp: 0.2
      sleep rrand(4, 6)
    end
  end
end

live_loop :ambient_pads1 do
  sync :section1
  use_synth :dark_ambience
  with_fx :slicer, phase: 0.5, wave: 1, mix: 0.2 do
    play chord(:e3, :minor7), attack: 3, sustain: 10, release: 8, cutoff: rrand(70, 120), amp: 0.2
  end
  sleep choose([16, 24, 32])
end

live_loop :background_texture1 do
  sync :section1
  with_fx :ring_mod, freq: 30, mix: 0.3 do
    with_fx :reverb, room: 1, mix: 0.8 do
      sample :ambi_soft_buzz, rate: 0.5, amp: 0.1
      sleep (sample_duration(:ambi_soft_buzz) / 2) + rrand(0, 2)
    end
  end
end

# Section 2 Live Loops
live_loop :low_notes_section2 do
  sync :section2
  use_synth :dark_ambience
  with_fx :reverb, room: 1, mix: 0.7 do
    with_fx :echo, phase: 0.5, decay: 6 do
      play choose([:c2, :d2, :e2, :g2]), attack: 3, sustain: 10, release: 7, cutoff: rrand(50, 90), amp: 0.3
    end
  end
  sleep choose([16, 20, 24])
end

live_loop :melody_section2 do
  sync :section2
  use_synth :blade
  with_fx :flanger, depth: 0.8, mix: 0.4 do
    with_fx :echo, phase: 0.4, decay: 5 do
      play (scale :e5, :minor_pentatonic).choose, attack: 1.5, sustain: 3, release: 2.5, amp: 0.3
      sleep rrand(4, 6)
    end
  end
end

live_loop :ambient_pads_section2 do
  sync :section2
  use_synth :prophet
  with_fx :slicer, phase: 0.3, wave: 0, mix: 0.3 do
    play chord(:g3, :minor7), attack: 2.5, sustain: 10, release: 8, cutoff: rrand(80, 130), amp: 0.2
  end
  sleep choose([16, 24, 32])
end

live_loop :background_texture_section2 do
  sync :section2
  with_fx :distortion, distort: 0.2 do
    with_fx :reverb, room: 1, mix: 0.8 do
      sample :ambi_soft_buzz, rate: 0.4, amp: 0.1
      sleep (sample_duration(:ambi_soft_buzz) / 2) + rrand(0, 2)
    end
  end
end

live_loop :percussions_section2 do
  sync :section2
  with_fx :echo, phase: 0.2, decay: 3 do
    with_fx :reverb, room: 0.9, mix: 0.6 do
      sample :drum_tom_lo_soft, amp: 1.2, rate: -1
      sleep choose([4, 6, 8])
    end
  end
end

# Section 3 Live Loops
live_loop :low_notes_section3 do
  sync :section3
  use_synth :hollow
  with_fx :reverb, room: 0.8, mix: 0.6 do
    with_fx :echo, phase: 1, decay: 10 do
      play choose([:e1, :f1, :g1, :a1]), attack: 4, sustain: 10, release: 8, cutoff: rrand(40, 80), amp: 0.2
    end
  end
  sleep choose([20, 24, 28])
end

live_loop :melody_section3 do
  sync :section3
  use_synth :piano
  with_fx :flanger, depth: 1, mix: 0.2 do
    with_fx :echo, phase: 0.6, decay: 6 do
      play (scale :e4, :minor_pentatonic).choose, attack: 1, sustain: 4, release: 3, amp: 0.2
      sleep rrand(5, 7)
    end
  end
end

live_loop :ambient_pads_section3 do
  sync :section3
  use_synth :blade
  with_fx :slicer, phase: 0.4, wave: 1, mix: 0.2 do
    play chord(:e2, :minor), attack: 3, sustain: 12, release: 8, cutoff: rrand(60, 100), amp: 0.2
  end
  sleep choose([20, 24, 32])
end

live_loop :background_texture_section3 do
  sync :section3
  with_fx :bitcrusher, bits: 8 do
    with_fx :reverb, room: 1, mix: 0.7 do
      sample :ambi_soft_buzz, rate: 0.6, amp: 0.1
      sleep (sample_duration(:ambi_soft_buzz) / 2) + rrand(1, 3)
    end
  end
end

live_loop :percussions_section3 do
  sync :section3
  with_fx :echo, phase: 0.3, decay: 4 do
    with_fx :reverb, room: 0.7, mix: 0.5 do
      sample :drum_heavy_kick, amp: 1.2, rate: -1
      sleep choose([4, 6, 8])
    end
  end
end

# Change Sections
live_loop :change_sections do
  sleep 30  # Time for Section 1
  set :section, 2
  sleep 180  # Time for Section 2
  set :section, 3
  sleep 90  # Time for Section 3
  set :section, 1  # Loop back to Section 1
end
