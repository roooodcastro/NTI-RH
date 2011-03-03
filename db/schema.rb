# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110303194632) do

  create_table "cargos", :force => true do |t|
    t.string   "nome"
    t.string   "pre_requisitos"
    t.float    "salario_piso"
    t.float    "salario_teto"
    t.string   "tempo_minimo"
    t.string   "tempo_maximo"
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comentarios", :force => true do |t|
    t.integer  "autor_id"
    t.text     "texto"
    t.integer  "destinatario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "competencias", :force => true do |t|
    t.integer  "grau"
    t.integer  "pessoa_id"
    t.integer  "conhecimento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conhecimentos", :force => true do |t|
    t.string   "nome"
    t.string   "dominio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participacao_projetos", :force => true do |t|
    t.date     "dataInicio"
    t.date     "dataTermino"
    t.integer  "vinculo_id"
    t.integer  "cargo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "projeto_id"
  end

  create_table "pessoas", :force => true do |t|
    t.string   "nome"
    t.string   "cpf",        :limit => 11
    t.string   "celular",    :limit => 10
    t.string   "endereco"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projetos", :force => true do |t|
    t.string   "nome"
    t.date     "data_inicial"
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "data_final"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vinculos", :force => true do |t|
    t.integer  "pessoa_id"
    t.date     "dataEntrada"
    t.date     "dataSaida"
    t.float    "salario"
    t.string   "banco"
    t.string   "agencia"
    t.integer  "conta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
