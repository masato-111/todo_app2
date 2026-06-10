Rails.application.routes.draw do
  # タスクのCRUD機能（一覧、詳細、新規登録、編集、削除）を一括有効化
  resources :tasks

  # トップページ（/）を開いたらタスク一覧を表示する
  root to: "home#index"
end