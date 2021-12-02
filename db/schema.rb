# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_28_222817) do

  create_table "enderecos", force: :cascade do |t|
    t.string "cep"
    t.string "cidade"
    t.text "logradouro"
    t.text "complemento"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "bairro"
    t.index ["user_id"], name: "index_enderecos_on_user_id"
  end

  create_table "entregadors", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "cpf"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lojas", force: :cascade do |t|
    t.time "abertura"
    t.time "fechamento"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer "endereco_id", null: false
    t.integer "entregador_id", null: false
    t.float "precoTotal"
    t.string "status"
    t.integer "quantidadePizzas"
    t.text "observacao"
    t.string "nomeDest"
    t.string "contato"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cpfDest"
    t.index ["endereco_id"], name: "index_pedidos_on_endereco_id"
    t.index ["entregador_id"], name: "index_pedidos_on_entregador_id"
  end

  create_table "pizzas", force: :cascade do |t|
    t.integer "pedido_id"
    t.float "tamanho"
    t.integer "fatias"
    t.float "preco"
    t.text "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sabor1_id"
    t.integer "sabor2_id"
    t.index ["pedido_id"], name: "index_pizzas_on_pedido_id"
    t.index ["sabor1_id"], name: "index_pizzas_on_sabor1_id"
    t.index ["sabor2_id"], name: "index_pizzas_on_sabor2_id"
  end

  create_table "sabors", force: :cascade do |t|
    t.string "descricaoSabor"
    t.float "preco"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cpf"
    t.string "telefone"
    t.string "nome"
    t.boolean "adm"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "pedidos", "enderecos"
  add_foreign_key "pedidos", "entregadors"
end
