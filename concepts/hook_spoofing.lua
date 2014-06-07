local function GetIndex( tabl, value )

  for k,v in pairs( tabl ) do
    if v == value then
      return k
    else
      continue
    end
  end
  
  return nil
  
end

local function SpoofHook( hook_name, func )
  
  local base, index = function( ) end, ''
  
  if not hook.GetTable( )[ hook_name ] then
    return nil
  end
  
  if #hook.GetTable( )[ hook_name ] < 1 then
    return nil
  end
  
  base = table.Random( hook.GetTable( )[ hook_name ] )
  index = GetIndex( hook.GetTable( )[ hook_name ] , base )
  
  local stub = function( ... ) 
    func( ... )
    base( ... )
  end
  
  
  hook.GetTable( )[ hook_name ][ index ] = stub -- Hook now spoofed and hook remains functional.
  
end

--[[

hook.Add( 'TestHook' , 'TestIndex', function( )
  print( 'Test' )
end)

TestHook: 'Test'
TestHook: 'Test'

-- now we spoof

SpoofHook( 'TestHook', function( ) print( 'Hooked' ) end)

TestHook: 'Hooked', 'Test'
TestHook: 'Hooked', 'Test'

-- Our code now runs before everyone elses.

]]--

--[[

What more can we do?
Rewrite hook.Call to give our stub function absolute priority instead of gambling on our index to be low enough.

]]--

  
