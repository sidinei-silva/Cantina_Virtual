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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_08_21_151515) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acompanhamentos", force: :cascade do |t|
    t.decimal "preco_acompanhamento", precision: 8, scale: 2
    t.string "nome_acompanhamento"
    t.boolean "esta_ativo"
    t.bigint "produto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_acompanhamentos_on_produto_id"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome_cliente"
    t.string "status_cliente"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_clientes_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clientes_on_reset_password_token", unique: true
  end

  create_table "item_acompanhamentos", force: :cascade do |t|
    t.decimal "preco_item_acompanhamento", precision: 8, scale: 2
    t.bigint "item_pedido_id"
    t.bigint "acompanhamento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["acompanhamento_id"], name: "index_item_acompanhamentos_on_acompanhamento_id"
    t.index ["item_pedido_id"], name: "index_item_acompanhamentos_on_item_pedido_id"
  end

  create_table "item_pedidos", force: :cascade do |t|
    t.integer "quantidade_item_pedido"
    t.decimal "total_item_pedido", precision: 8, scale: 2
    t.bigint "produto_id"
    t.bigint "pedido_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pedido_id"], name: "index_item_pedidos_on_pedido_id"
    t.index ["produto_id"], name: "index_item_pedidos_on_produto_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.string "status_pedido"
    t.decimal "total_pedido", precision: 8, scale: 2
    t.bigint "cliente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "motivo_cancelamento"
    t.index ["cliente_id"], name: "index_pedidos_on_cliente_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome_produto"
    t.string "descricao_produto"
    t.decimal "preco_produto", precision: 8, scale: 2
    t.boolean "esta_ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "acompanhamentos", "produtos"
  add_foreign_key "item_acompanhamentos", "acompanhamentos"
  add_foreign_key "item_acompanhamentos", "item_pedidos"
  add_foreign_key "item_pedidos", "pedidos"
  add_foreign_key "item_pedidos", "produtos"
  add_foreign_key "pedidos", "clientes"
end
