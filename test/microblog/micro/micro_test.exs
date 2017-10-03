defmodule Microblog.MicroTest do
  use Microblog.DataCase

  alias Microblog.Micro

  describe "messages" do
    alias Microblog.Micro.Message

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def message_fixture(attrs \\ %{}) do
      {:ok, message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Micro.create_message()

      message
    end

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Micro.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Micro.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      assert {:ok, %Message{} = message} = Micro.create_message(@valid_attrs)
      assert message.name == "some name"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Micro.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      assert {:ok, message} = Micro.update_message(message, @update_attrs)
      assert %Message{} = message
      assert message.name == "some updated name"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Micro.update_message(message, @invalid_attrs)
      assert message == Micro.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Micro.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Micro.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Micro.change_message(message)
    end
  end

  describe "messages" do
    alias Microblog.Micro.Message

    @valid_attrs %{common: "some common", date: ~D[2010-04-17], description: "some description", like: 42, name: "some name", report: 42}
    @update_attrs %{common: "some updated common", date: ~D[2011-05-18], description: "some updated description", like: 43, name: "some updated name", report: 43}
    @invalid_attrs %{common: nil, date: nil, description: nil, like: nil, name: nil, report: nil}

    def message_fixture(attrs \\ %{}) do
      {:ok, message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Micro.create_message()

      message
    end

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Micro.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Micro.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      assert {:ok, %Message{} = message} = Micro.create_message(@valid_attrs)
      assert message.common == "some common"
      assert message.date == ~D[2010-04-17]
      assert message.description == "some description"
      assert message.like == 42
      assert message.name == "some name"
      assert message.report == 42
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Micro.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      assert {:ok, message} = Micro.update_message(message, @update_attrs)
      assert %Message{} = message
      assert message.common == "some updated common"
      assert message.date == ~D[2011-05-18]
      assert message.description == "some updated description"
      assert message.like == 43
      assert message.name == "some updated name"
      assert message.report == 43
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Micro.update_message(message, @invalid_attrs)
      assert message == Micro.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Micro.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Micro.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Micro.change_message(message)
    end
  end

  describe "messages" do
    alias Microblog.Micro.Message

    @valid_attrs %{date: ~D[2010-04-17], description: "some description", "user-name": "some user-name"}
    @update_attrs %{date: ~D[2011-05-18], description: "some updated description", "user-name": "some updated user-name"}
    @invalid_attrs %{date: nil, description: nil, "user-name": nil}

    def message_fixture(attrs \\ %{}) do
      {:ok, message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Micro.create_message()

      message
    end

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Micro.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Micro.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      assert {:ok, %Message{} = message} = Micro.create_message(@valid_attrs)
      assert message.date == ~D[2010-04-17]
      assert message.description == "some description"
      assert message.user-name == "some user-name"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Micro.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      assert {:ok, message} = Micro.update_message(message, @update_attrs)
      assert %Message{} = message
      assert message.date == ~D[2011-05-18]
      assert message.description == "some updated description"
      assert message.user-name == "some updated user-name"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Micro.update_message(message, @invalid_attrs)
      assert message == Micro.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Micro.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Micro.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Micro.change_message(message)
    end
  end
end
