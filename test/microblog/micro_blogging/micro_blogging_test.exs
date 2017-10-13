defmodule Microblog.Micro_bloggingTest do
  use Microblog.DataCase

  alias Microblog.Micro_blogging

  describe "messages" do
    alias Microblog.Micro_blogging.Message

    @valid_attrs %{date: ~D[2010-04-17], description: "some description", "user-name": "some user-name"}
    @update_attrs %{date: ~D[2011-05-18], description: "some updated description", "user-name": "some updated user-name"}
    @invalid_attrs %{date: nil, description: nil, "user-name": nil}

    def message_fixture(attrs \\ %{}) do
      {:ok, message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Micro_blogging.create_message()

      message
    end

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Micro_blogging.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Micro_blogging.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      assert {:ok, %Message{} = message} = Micro_blogging.create_message(@valid_attrs)
      assert message.date == ~D[2010-04-17]
      assert message.description == "some description"
      assert message.user-name == "some user-name"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Micro_blogging.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      assert {:ok, message} = Micro_blogging.update_message(message, @update_attrs)
      assert %Message{} = message
      assert message.date == ~D[2011-05-18]
      assert message.description == "some updated description"
      assert message.user-name == "some updated user-name"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Micro_blogging.update_message(message, @invalid_attrs)
      assert message == Micro_blogging.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Micro_blogging.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Micro_blogging.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Micro_blogging.change_message(message)
    end
  end

  describe "messages" do
    alias Microblog.Micro_blogging.Message

    @valid_attrs %{date: ~D[2010-04-17], description: "some description", username: "some username"}
    @update_attrs %{date: ~D[2011-05-18], description: "some updated description", username: "some updated username"}
    @invalid_attrs %{date: nil, description: nil, username: nil}

    def message_fixture(attrs \\ %{}) do
      {:ok, message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Micro_blogging.create_message()

      message
    end

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Micro_blogging.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Micro_blogging.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      assert {:ok, %Message{} = message} = Micro_blogging.create_message(@valid_attrs)
      assert message.date == ~D[2010-04-17]
      assert message.description == "some description"
      assert message.username == "some username"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Micro_blogging.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      assert {:ok, message} = Micro_blogging.update_message(message, @update_attrs)
      assert %Message{} = message
      assert message.date == ~D[2011-05-18]
      assert message.description == "some updated description"
      assert message.username == "some updated username"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Micro_blogging.update_message(message, @invalid_attrs)
      assert message == Micro_blogging.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Micro_blogging.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Micro_blogging.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Micro_blogging.change_message(message)
    end
  end

  describe "messages" do
    alias Microblog.Micro_blogging.Message

    @valid_attrs %{content: "some content"}
    @update_attrs %{content: "some updated content"}
    @invalid_attrs %{content: nil}

    def message_fixture(attrs \\ %{}) do
      {:ok, message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Micro_blogging.create_message()

      message
    end

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Micro_blogging.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Micro_blogging.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      assert {:ok, %Message{} = message} = Micro_blogging.create_message(@valid_attrs)
      assert message.content == "some content"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Micro_blogging.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      assert {:ok, message} = Micro_blogging.update_message(message, @update_attrs)
      assert %Message{} = message
      assert message.content == "some updated content"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Micro_blogging.update_message(message, @invalid_attrs)
      assert message == Micro_blogging.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Micro_blogging.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Micro_blogging.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Micro_blogging.change_message(message)
    end
  end

  describe "likes" do
    alias Microblog.Micro_blogging.Like

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def like_fixture(attrs \\ %{}) do
      {:ok, like} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Micro_blogging.create_like()

      like
    end

    test "list_likes/0 returns all likes" do
      like = like_fixture()
      assert Micro_blogging.list_likes() == [like]
    end

    test "get_like!/1 returns the like with given id" do
      like = like_fixture()
      assert Micro_blogging.get_like!(like.id) == like
    end

    test "create_like/1 with valid data creates a like" do
      assert {:ok, %Like{} = like} = Micro_blogging.create_like(@valid_attrs)
    end

    test "create_like/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Micro_blogging.create_like(@invalid_attrs)
    end

    test "update_like/2 with valid data updates the like" do
      like = like_fixture()
      assert {:ok, like} = Micro_blogging.update_like(like, @update_attrs)
      assert %Like{} = like
    end

    test "update_like/2 with invalid data returns error changeset" do
      like = like_fixture()
      assert {:error, %Ecto.Changeset{}} = Micro_blogging.update_like(like, @invalid_attrs)
      assert like == Micro_blogging.get_like!(like.id)
    end

    test "delete_like/1 deletes the like" do
      like = like_fixture()
      assert {:ok, %Like{}} = Micro_blogging.delete_like(like)
      assert_raise Ecto.NoResultsError, fn -> Micro_blogging.get_like!(like.id) end
    end

    test "change_like/1 returns a like changeset" do
      like = like_fixture()
      assert %Ecto.Changeset{} = Micro_blogging.change_like(like)
    end
  end
end
