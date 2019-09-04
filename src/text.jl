export Txt, text, text!

struct Txt <: GeometricObject
    pos::Point
    text::String
    size::Float64
    halign::Symbol
    valign::Symbol
    angle::Angle
    font::String
end

text(args...) = Shape(Txt, args...)
function text!(layer::Layer, args...)
    r = text(args...)
    push!(layer, r)
    r
end
text(f::Function, args...) = Shape(f, Txt, args...)
function text!(f::Function, layer::Layer, args...)
    r = text(f, args...)
    push!(layer, r)
    r
end

needed_attributes(::Type{Txt}) = (Visible, Fill, Font)
