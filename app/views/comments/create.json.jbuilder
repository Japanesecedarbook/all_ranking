json.text  @comment.text
json.user_id  @comment.user.id
json.user_name  @comment.user.name
json.created_at @comment.created_at.strftime("%Y-%m-%d %H:%M")
json.ranking_id @comment.ranking.user_id