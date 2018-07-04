module Menu
  def self.menu
    puts 'Ingrese una opción
      1: Leer todas las trending topics.
      2: Escribir un #hashtag
      3: Ingresar nombre de usuario
      0: Salir'
    num = gets.strip
    case num
    when '1'
      return '#HOLA'
    when '2'
      puts 'Escriba un Hashtag'
      hashtag = gets.strip
      return '#' + hashtag
    when '3'
      puts 'Ingrese nombre de usuario que desea buscar'
      nombre = gets.strip
      return 'El usuario buscado es @' + nombre
    when '0'
      return ' ------ Usted ha salido del Menú ------ '
    end
  end
end
