#MACRODACTYL, MUTHA FUCKERS
#created with Sonic Pi v3.0.1


#Edit the path to the audio file
MMF = "/path/to/MMF_j.aiff"

use_bpm 160

xx = 4
HIPHOP = 0
#range(0.8, 1.2, step: 0.01).tick

live_loop :mudafuka do
  with_fx :compressor, amp: 9 do
    sample MMF, rate: 1, pitch_stretch: 8.4, start: 0.04, amp: 4
    sleep 8
  end
end

live_loop :fux do
  with_fx :nlpf, cutoff: 4, mix: 1, amp: 0 do
    with_fx :compressor, amp: 1 do
      with_fx :ring_mod, mix: 1, freq: 30, amp: 3 do
        sample MMF, amp: 6, rate: 0.7, num_slices: 16, start: 0.04, slice: ring(3, 6, 9, 14).stretch(xx).tick
        sleep 0.5
      end
    end
  end
end

live_loop :drum do
  sample :loop_amen, amp: 0, rate: 1, beat_stretch: 4, num_slices: 32, slice: range(0, 32).stretch(xx).tick
  sleep 0.125
end

live_loop :kix do
  with_fx :distortion, distort: 0.4, amp: 0 do
    sample :bd_haus, amp: 5
    sleep 1
  end
end

live_loop :hat do
  # sync :kix
  sleep 0.5
  sample :elec_cymbal, amp: 0, finish: 0.2
  sleep 0.5
end

live_loop :cap do
  # sync :hat
  sample :drum_cymbal_closed, rate: rrand(1, 1.4), amp: 0, finish: 0.5
  sleep 0.25
end

live_loop :slo do
  sample :bd_boom, amp: HIPHOP*6
  sleep 2
  sample :sn_dolf, rate: 1.5, amp: HIPHOP*8
  sleep 3
  sample :bd_boom, amp: HIPHOP*6
  sleep 1
  sample :sn_dolf, rate: 1.5, amp: HIPHOP*8
  sleep 0.5
  sample :bd_boom, amp: HIPHOP*6
  sleep 1.5
end
