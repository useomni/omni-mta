local instance = {}

instance.isMouseIn = function( x, y, width, height )
    if not isCursorShowing() then
        return false
    end
    local scrX, scrY = guiGetScreenSize()
    local cursorX, cursorY = getCursorPosition()
    local cursorX, cursorY = ( cursorX * scrX ), ( cursorY * scrY )
    return ( ( cursorX >= x and cursorX <= x + width ) and ( cursorY >= y and cursorY <= y + height ) )
end

module.exports("@omni/useful", instance)